# FAS Language Server Protocol Implementation

This project implements a Language Server Protocol (LSP) for FAS (Fast Load) files, commonly used in AutoCAD for compiled LISP code. It provides features like decompilation, code navigation, and symbol lookup.

## Features

- FAS file parsing and decompilation
- Symbol lookup and navigation
- Code completion (planned)
- Hover information
- Go to definition

## Installation

1. Ensure you have Python 3.8 or newer installed
2. Install Poetry (package manager):
   ```bash
   curl -sSL https://install.python-poetry.org | python3 -
   ```
3. Clone this repository and install dependencies:
   ```bash
   git clone <repository-url>
   cd fas-lsp
   poetry install
   ```

## Usage

1. Start the language server:
   ```bash
   poetry run fas-lsp
   ```

2. Configure your editor to use the FAS language server:
   - For VS Code: Install the FAS LSP extension (coming soon)
   - For other editors: Configure the LSP client to connect to the server

## Development

The project structure:
```
fas-lsp/
├── server/
│   ├── server.py          # LSP server implementation
│   ├── fas_parser.py      # FAS file parser
│   ├── decompiler/        # Decompiler components
│   └── protocol/          # LSP protocol handlers
└── client/               # Editor extension
```

To run tests:
```bash
poetry run pytest
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

MIT License #   F a s 2 L s p  
 