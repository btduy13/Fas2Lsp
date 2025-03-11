# FAS to LSP Converter

A comprehensive toolkit for working with AutoCAD FAS (Fast Load) files, including decompilation to LSP (LISP) format and a Language Server Protocol implementation for enhanced development experience.

## Overview

This project provides tools to:
1. Parse and decompile FAS files (both standard and FAS4 format) to human-readable LSP (LISP) code
2. Analyze the structure and content of FAS files
3. Provide Language Server Protocol (LSP) features for FAS files in compatible editors

FAS files are compiled AutoLISP code used in AutoCAD. This toolkit makes it easier to work with these files by converting them back to their original LISP format and providing modern development tools.

## Features

- **FAS Decompilation**: Convert FAS files to readable LSP (LISP) code
- **Multiple Format Support**: Handles both standard FAS and FAS4 file formats
- **Symbol Extraction**: Extracts and displays symbols, functions, and string tables
- **LSP Integration**: Language Server Protocol implementation for IDE integration
- **Analysis Tools**: Utilities to analyze and understand FAS file structure

## Installation

### Prerequisites
- Python 3.8 or newer
- Poetry (Python package manager)

### Setup
1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/fas-lsp.git
   cd fas-lsp
   ```

2. Install dependencies using Poetry:
   ```bash
   poetry install
   ```

3. Activate the virtual environment:
   ```bash
   poetry shell
   ```

## Usage

### Decompiling FAS Files

#### Universal Decompiler (Recommended)
To decompile any FAS file (automatically detects format):
```bash
python decompile_any.py path/to/your/file.fas
```

You can also specify a custom output file:
```bash
python decompile_any.py path/to/your/file.fas -o path/to/output.lsp
```

#### Format-Specific Decompilers
To decompile a standard FAS file:
```bash
python decompile.py
```

To decompile a FAS4 format file:
```bash
python decompile_fas4.py
```

By default, these scripts will process the included sample file `PurgeDictionaryItems[PDI].fas`. To use a different file, edit the script or modify the `input_file` variable.

### Analyzing FAS Files

To analyze the structure of a FAS file:
```bash
python analyze_fas.py
```

For decrypted FAS content analysis:
```bash
python analyze_decrypted.py
```

### Using the Language Server

Start the LSP server:
```bash
poetry run fas-lsp
```

Configure your editor to use the FAS language server. The server provides features like:
- Hover information for symbols
- Decompilation of FAS files on open
- Symbol navigation

## Project Structure

```
fas-lsp/
├── server/                  # LSP server implementation
│   ├── fas_parser.py        # Parser for standard FAS files
│   ├── fas4_parser.py       # Parser for FAS4 format files
│   └── server.py            # LSP server implementation
├── client/                  # Editor extension (placeholder)
├── decompile_any.py         # Universal decompiler (auto-detects format)
├── decompile.py             # Script to decompile standard FAS files
├── decompile_fas4.py        # Script to decompile FAS4 format files
├── analyze_fas.py           # Utility to analyze FAS file structure
├── analyze_decrypted.py     # Utility to analyze decrypted FAS content
├── create_test_fas.py       # Utility to create test FAS files
├── PurgeDictionaryItems[PDI].fas  # Sample FAS file
└── pyproject.toml           # Project configuration and dependencies
```

## Examples

### Decompiled LSP Output

The decompilation process converts binary FAS files into readable LISP code:

```lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PurgeDictionaryItems - Utility for cleaning up dictionaries
;; Decompiled from FAS4 format
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun PURGE_DICTIONARY_ITEMS (DICTIONARY_ITEMS / DICTIONARY ITEMS ITEM)
  (if (= (type DICTIONARY_ITEMS) 'LIST)
    (progn
      (foreach DICTIONARY DICTIONARY_ITEMS
        (if (= (type DICTIONARY) 'STR)
          (if (setq DICTIONARY (dictnext (namedobjdict) DICTIONARY T))
            (progn
              (setq ITEMS (tblsearch "DICTIONARY" DICTIONARY))
              (foreach ITEM ITEMS
                (dictremove DICTIONARY ITEM)
              )
            )
          )
        )
      )
      T
    )
    nil
  )
)
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.