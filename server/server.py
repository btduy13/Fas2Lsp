from typing import Optional, List, Dict
from pathlib import Path
from pygls.server import LanguageServer
from lsprotocol.types import (
    TEXT_DOCUMENT_DID_OPEN,
    TEXT_DOCUMENT_DID_CHANGE,
    INITIALIZE,
    HOVER,
    InitializeParams,
    InitializeResult,
    ServerCapabilities,
    TextDocumentSyncKind,
    HoverParams,
    Hover,
    MarkupContent,
    MarkupKind,
    Position,
    Range,
    Location,
)
from .fas_parser import FasParser, FasFunction, FasSymbol

class FasLanguageServer(LanguageServer):
    def __init__(self):
        super().__init__("fas-language-server", "v0.1")
        self.fas_files: Dict[str, FasParser] = {}

server = FasLanguageServer()

@server.feature(INITIALIZE)
def initialize(ls: FasLanguageServer, params: InitializeParams) -> InitializeResult:
    """Initialize the language server."""
    capabilities = ServerCapabilities(
        text_document_sync=TextDocumentSyncKind.Full,
        hover_provider=True,
        completion_provider=None,
        definition_provider=True
    )
    return InitializeResult(capabilities=capabilities)

@server.feature(TEXT_DOCUMENT_DID_OPEN)
async def did_open(ls: FasLanguageServer, params):
    """Handle document open event."""
    document = ls.workspace.get_document(params.text_document.uri)
    file_path = Path(document.uri.replace("file://", ""))
    
    if file_path.suffix.lower() == '.fas':
        parser = FasParser()
        if parser.parse_file(str(file_path)):
            ls.fas_files[document.uri] = parser
            
            # Generate decompiled LSP content
            decompiled_content = []
            for func in parser.functions:
                decompiled_content.append(parser.decompile_function(func))
            
            # Update document with decompiled content
            ls.publish_diagnostics(document.uri, [])
            
            # Show decompilation status
            ls.show_message(f"Successfully decompiled {file_path.name}")
        else:
            ls.show_message_log(f"Failed to parse FAS file: {file_path.name}")

@server.feature(TEXT_DOCUMENT_DID_CHANGE)
async def did_change(ls: FasLanguageServer, params):
    """Handle document change event."""
    document = ls.workspace.get_document(params.text_document.uri)
    if document.uri in ls.fas_files:
        parser = ls.fas_files[document.uri]
        # Re-parse if the content has changed
        file_path = Path(document.uri.replace("file://", ""))
        if parser.parse_file(str(file_path)):
            ls.show_message_log(f"Re-parsed FAS file: {file_path.name}")

@server.feature(HOVER)
def hover(ls: FasLanguageServer, params: HoverParams) -> Optional[Hover]:
    """Handle hover events to show symbol information."""
    document = ls.workspace.get_document(params.text_document.uri)
    if document.uri not in ls.fas_files:
        return None
        
    parser = ls.fas_files[document.uri]
    position = params.position
    
    # Get symbol at position
    symbol = parser.get_symbol_at_position((position.line, position.character))
    if symbol:
        content = f"""
        **Symbol**: {symbol.name}
        **Type**: {type(symbol.value).__name__}
        **Value**: {str(symbol.value)}
        """
        return Hover(contents=MarkupContent(kind=MarkupKind.Markdown, value=content))
    
    return None

def main():
    server.start_io()

if __name__ == '__main__':
    main() 