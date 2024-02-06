# LSP setup

This documentation shows where the lsp config, linter config and formatter
config are found for the different programming languages.

## Python

- LSP:
  - file: [nvim-lspconfig](../lua/plugins/lsp/nvim-lspconfig.lua)
  - server: pyright
  - description: you can add diagnostic rules here
- Linters: [](../lua/plugins/lsp/nvim-lspconfig.lua)
  - file: [nvim-lspconfig](../lua/plugins/lsp/nvim-lspconfig.lua)
  - server: pylsp (pycodestyle, pydocstyle)}}}
  - description: this server contains various linters as plugins
- Formatter:
  - file: [conform-formatter](../lua/plugins/lsp/conform-formatter.lua)
  - server: isort, black
  - description: import sorter and code formatter

## C

- LSP:
  - file: [nvim-lspconfig](../lua/plugins/lsp/nvim-lspconfig.lua)
  - server: clangd
  - description: you can configure diagnostic rules here
- Linters: [](../lua/plugins/lsp/nvim-lspconfig.lua)
  - file: [ale](../lua/plugins/lsp/ale-linter.lua)
  - server: betty, gcc
  - description: you can use betty with the help of Ale and betty-vim plugin
- Formatter:
  - file: [conform-formatter](../lua/plugins/lsp/conform-formatter.lua)
  - server: clang-format
