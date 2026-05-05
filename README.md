# Fas2Lsp

Fas2Lsp is an experimental toolkit for decoding AutoCAD/BricsCAD FAS files back into readable AutoLISP (`.lsp`) output.

The project currently focuses on FAS4 files and includes a practical compatibility path for loading decoded output in BricsCAD, especially for cases where BricsCAD cannot load AutoCAD `.fas` files directly.

## Current Status

This is not a perfect source-code recovery tool. FAS files do not preserve all original source structure, names, comments, or external runtime dependencies. The generated `.lsp` is best treated as a reconstructed, editable starting point.

The current decoder can:

- Parse and disassemble FAS4 bytecode.
- Recover many function definitions, command names, local variables, string literals, and symbol references.
- Emit runnable AutoLISP-style output where possible.
- Add compatibility helpers for decoded calls that collide with BricsCAD or AutoLISP built-ins.
- Validate generated `.lsp` syntax with the included validator.

Known limitations:

- Decompiled output may still need manual cleanup.
- External application frameworks are not bundled automatically. If a FAS file depends on other `.fas`, `.vlx`, `.arx`, `.dcl`, `.odcl`, or `.lsp` files, those dependencies are still required or must be stubbed.
- Some helper behavior is inferred from bytecode usage, not recovered from original source.
- Command behavior should always be tested in CAD before using it on important drawings.

## Repository Contents

```text
Fas2Lsp/
  fas4_decompiler.py       Main FAS4 decoder and AutoLISP generator
  validate.py              Generated LSP syntax validator
  bib.fas                  Sample/input FAS file currently under investigation
  bib_generic.lsp          Generated LSP output for bib.fas
  PDI.fas                  Small sample FAS file
  PDI_generic.lsp          Generated LSP output for PDI.fas
  compare_lsp.py           Output comparison helper
  decrypt_fas4.py          FAS4 decoding/decryption helper
  analyze_rosetta.py       Analysis helper
  test_disasm.py           Disassembler test scaffold
  server/                  Older parser/LSP server experiments
```

## Requirements

- Python 3.8 or newer
- BricsCAD or AutoCAD for testing generated AutoLISP

No network service is required for local decoding.

## Basic Usage

Decode a FAS4 file:

```powershell
python fas4_decompiler.py bib.fas bib_generic.lsp
```

Validate generated output:

```powershell
python validate.py bib_generic.lsp
```

Load the decoded file in BricsCAD:

```lisp
(load "F:/Fas2Lsp/bib_generic.lsp")
```

Call a decoded command, for example:

```lisp
POLYCC
```

## BricsCAD Compatibility Notes

BricsCAD cannot load AutoCAD `.fas` files directly in many cases, so this project emits plain `.lsp` output.

The generator now includes compatibility helpers for several decoded patterns found in `bib.fas`, including:

- One-argument decoded `POLAR` calls routed through `fas-polar1`.
- Project-style `RTOS` calls routed through `fas-rtos1` / `fas-rtos3` so they do not collide with AutoLISP `rtos`.
- Project-style `GETVAR` calls routed through `fas-getvar2` / `fas-getvar3`.
- `IN_PARAM` lookup support for lists, association lists, lambda-style selectors, and entity DXF group reads.
- A BricsCAD selection fallback for the missing `PROJET/PA_PROJET/AR_PROJET` project dialog.

For `POLYCC`, the original FAS appears to call a project selection/dialog framework named `Projet/PA_Projet`. That framework is not present in this repository, so the generated file uses a fallback entity selection prompt. This allows the command to load and continue in BricsCAD, but it is not a full replacement for the original application UI.

## Regenerating Included Outputs

Regenerate both included sample outputs:

```powershell
python fas4_decompiler.py bib.fas bib_generic.lsp
python fas4_decompiler.py PDI.fas PDI_generic.lsp
python validate.py bib_generic.lsp
python validate.py PDI_generic.lsp
```

Expected validator output:

```text
[PASS] bib_generic.lsp
[PASS] PDI_generic.lsp
```

## Development Notes

When improving decoder quality, prefer fixing `fas4_decompiler.py` and regenerating the `.lsp` output instead of hand-editing generated files. Hand patches are useful for experiments, but decoder-level fixes are repeatable across files.

Useful checks:

```powershell
python -m py_compile fas4_decompiler.py
python validate.py bib_generic.lsp
python validate.py PDI_generic.lsp
```

If a generated file loads but a command fails in CAD, capture:

- The exact command called.
- The exact BricsCAD/AutoCAD error text.
- The expression shown near the error.
- The call stack if available.

That information usually identifies whether the issue is syntax recovery, function arity recovery, a built-in name collision, or a missing external dependency.

## Safety

Generated LSP should be reviewed before use. Test in a scratch drawing first. Some decoded commands may create, modify, or delete drawing entities depending on the original FAS behavior.
