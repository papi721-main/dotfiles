return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- Linters
      -- "eslint-lsp", --TypeScript & JavaScript
      -- "markdownlint", -- Markdown
      "shellcheck", -- Bash

      -- Formatters
      "stylua", -- Lua
      "shfmt", -- Bash
      "black", -- Python
      "isort", -- Python (for formatting imports)
      "clang-format", -- C and C++
      -- "prettier", -- HTML, CSS, and JS
      -- "mdformat", -- Markdown
      -- "sql-formatter", -- SQL
    },
  },
}
