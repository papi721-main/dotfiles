return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    -- Add your LSPs (only) here, add linter and formatters in mason config
    servers = {
      -- Bash
      bashls = {},

      -- C, C++ and Rust
      clangd = {},

      -- CSS
      cssls = {},

      -- HTML
      html = {},

      -- Json
      jsonls = {},

      -- Markdown
      marksman = {},

      -- SQL
      sqlls = {},

      -- Javascript and Typescript
      tsserver = {},

      -- Lua
      lua_ls = {
        -- mason = false, -- set to false if you don't want this server to be installed with mason
        -- Use this to add any additional keymaps
        -- for specific lsp servers
        -- @type LazyKeysSpec[]
        -- keys = {},
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            completion = {
              callSnippet = "Replace",
            },
            telemetry = { enable = false },
            diagnostics = {
              globals = { "vim" },
              disable = { "missing-fields" },
            },
          },
        },
      },

      -- Python
      pyright = {
        capabilities = (function()
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
          return capabilities
        end)(),
        settings = {
          python = {
            analysis = {
              diagnosticSeverityOverrides = {
                reportUnboundVariable = "none",
                reportGeneralTypeIssues = "none",
              },
              typeCheckingMode = "basic", -- off, basic, strict
            },
          },
        },
      },
      pylsp = {
        -- This a Python LSP server that comes packed with linters and formatters for the Python language.
        -- You can find more information on available plugins and thier
        -- configurations from this link: https://github.com/python-lsp/python-lsp-server
        settings = {
          pylsp = {
            plugins = {
              ruff = { -- linting, code action and formatting capabilities (already have Pyright, isort and black)
                enabled = false,
              },
              pycodestyle = { -- linter for style checking
                enabled = true,
                maxLineLength = 79,
              },
              pydocstyle = { -- linter for docstring style checking
                enabled = true,
                convention = "google",
                addIgnore = {
                  -- "D100", -- Missing docstring in public module
                  "D415", -- First line should end with a period, question mark or exclamation point
                  "D403", -- First word of the first line should start with a Capital letter
                  "D202", -- No blank lines allowed after function docstring
                },
              },
              pyflakes = { -- linter to detect various errors
                enabled = false,
              },
              mccabe = { -- linter for complexity checking
                enabled = false,
              },
            },
          },
        },
      },
    },
  },
}
