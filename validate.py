#!/usr/bin/env python3
import re
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Any, List, Tuple


LOGIC_COMMENT_RE = re.compile(r'^\s*;;.*\b(jump|unresolved|gfun_)\b', re.IGNORECASE)
SYMBOL_RE = re.compile(r'^[A-Za-z0-9_\-?!*/=<>+:.]+$')
NUMBER_RE = re.compile(r'^[+-]?(?:\d+(?:\.\d*)?|\.\d+)$')


@dataclass
class Token:
    kind: str
    value: str
    line: int


@dataclass
class Node:
    value: Any
    line: int
    kind: str = 'list'


def tokenize(text: str) -> Tuple[List[Token], List[str]]:
    tokens: List[Token] = []
    errors: List[str] = []
    i = 0
    line = 1
    while i < len(text):
        ch = text[i]
        if ch in ' \t\r':
            i += 1
            continue
        if ch == '\n':
            line += 1
            i += 1
            continue
        if ch == ';':
            while i < len(text) and text[i] != '\n':
                i += 1
            continue
        if ch in '()\'':
            tokens.append(Token(ch, ch, line))
            i += 1
            continue
        if ch == '"':
            start_line = line
            i += 1
            value = []
            while i < len(text):
                ch = text[i]
                if ch == '\\' and i + 1 < len(text):
                    value.append(text[i:i + 2])
                    i += 2
                    continue
                if ch == '"':
                    i += 1
                    break
                if ch == '\n':
                    line += 1
                value.append(ch)
                i += 1
            else:
                errors.append(f'line {start_line}: unterminated string')
            tokens.append(Token('string', ''.join(value), start_line))
            continue

        start = i
        start_line = line
        while i < len(text) and text[i] not in '()\'"; \t\r\n':
            i += 1
        tokens.append(Token('symbol', text[start:i], start_line))
    return tokens, errors


def parse_tokens(tokens: List[Token]) -> Tuple[List[Node], List[str]]:
    errors: List[str] = []
    pos = 0

    def parse_expr() -> Node:
        nonlocal pos
        if pos >= len(tokens):
            raise ValueError('unexpected EOF')
        tok = tokens[pos]
        pos += 1
        if tok.kind == '(':
            items: List[Node] = []
            while pos < len(tokens) and tokens[pos].kind != ')':
                items.append(parse_expr())
            if pos >= len(tokens):
                errors.append(f'line {tok.line}: missing closing parenthesis')
                return Node(items, tok.line, 'list')
            pos += 1
            return Node(items, tok.line, 'list')
        if tok.kind == ')':
            errors.append(f'line {tok.line}: unexpected closing parenthesis')
            return Node([], tok.line, 'list')
        if tok.kind == '\'':
            quoted = parse_expr()
            return Node([Node('quote', tok.line, 'symbol'), quoted], tok.line, 'list')
        if tok.kind == 'string':
            return Node(tok.value, tok.line, 'string')
        return Node(tok.value, tok.line, 'symbol')

    forms: List[Node] = []
    while pos < len(tokens):
        try:
            forms.append(parse_expr())
        except ValueError as exc:
            errors.append(str(exc))
            break
    return forms, errors


def form_text(node: Node, limit: int = 160) -> str:
    def render(item: Node) -> str:
        if item.kind == 'list':
            return '(' + ' '.join(render(child) for child in item.value) + ')'
        if item.kind == 'string':
            text = str(item.value).replace('\\', '\\\\').replace('"', '\\"')
            return f'"{text}"'
        return str(item.value)

    text = render(node)
    return text if len(text) <= limit else text[:limit - 3] + '...'


def is_symbol(node: Node) -> bool:
    if node.kind != 'symbol' or not isinstance(node.value, str):
        return False
    if node.value == 'quote':
        return False
    if NUMBER_RE.match(node.value):
        return False
    return True


def symbol_ok(value: str) -> bool:
    if value.startswith('c:'):
        return SYMBOL_RE.match(value) is not None
    if ':' in value:
        return False
    return SYMBOL_RE.match(value) is not None


def validate_balance(tokens: List[Token]) -> List[str]:
    errors: List[str] = []
    balance = 0
    for token in tokens:
        if token.kind == '(':
            balance += 1
        elif token.kind == ')':
            balance -= 1
            if balance < 0:
                errors.append(f'line {token.line}: closing parenthesis before opening parenthesis')
                break
    if balance != 0:
        errors.append(f'parentheses: balance is {balance}, expected 0')
    return errors


def validate_ast(forms: List[Node], text: str) -> List[str]:
    errors: List[str] = []

    for line_no, line in enumerate(text.splitlines(), start=1):
        if LOGIC_COMMENT_RE.search(line):
            errors.append(f'line {line_no}: logic placeholder comment: {line.strip()}')

    for form in forms:
        if not isinstance(form.value, list) or not form.value:
            errors.append(f'line {form.line}: top-level form is not a defun: {form_text(form)}')
            continue
        head = form.value[0].value
        if head != 'defun':
            errors.append(f'line {form.line}: top-level form is not a defun: {form_text(form)}')

    def walk(node: Node) -> None:
        value = node.value
        if is_symbol(node) and not symbol_ok(value.lower()):
            errors.append(f'line {node.line}: illegal symbol name: {value}')
            return
        if node.kind != 'list' or not value:
            return

        head = value[0].value if value else None
        if head == 'if' and len(value) < 3:
            errors.append(f'line {node.line}: if has too few forms: {form_text(node)}')
        elif head == 'while' and len(value) < 3:
            errors.append(f'line {node.line}: while has no body: {form_text(node)}')
        elif head == 'progn' and len(value) == 1:
            errors.append(f'line {node.line}: empty progn: {form_text(node)}')
        elif head == 'setq' and len(value) != 3:
            errors.append(f'line {node.line}: setq must have exactly two arguments: {form_text(node)}')
        elif head == 'foreach' and len(value) < 4:
            errors.append(f'line {node.line}: foreach must have var, list, and body: {form_text(node)}')

        for child in value:
            walk(child)

    for form in forms:
        walk(form)

    return errors


def validate_file(path: Path) -> bool:
    text = path.read_text(encoding='utf-8')
    tokens, token_errors = tokenize(text)
    forms, parse_errors = parse_tokens(tokens)
    errors = token_errors + validate_balance(tokens) + parse_errors + validate_ast(forms, text)
    if errors:
        print(f'[FAIL] {path}')
        for error in errors:
            print(f'  {error}')
        return False
    print(f'[PASS] {path}')
    return True


def main() -> int:
    if len(sys.argv) < 2:
        print('Usage: python validate.py <file.lsp> [file2.lsp ...]')
        return 2
    ok = True
    for arg in sys.argv[1:]:
        ok = validate_file(Path(arg)) and ok
    return 0 if ok else 1


if __name__ == '__main__':
    raise SystemExit(main())
