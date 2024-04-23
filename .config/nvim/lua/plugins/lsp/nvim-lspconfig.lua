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

      emmet_ls = {
        filetypes = {
          "html",
          "css",
          "eruby",
          -- "javascript",
          -- "javascriptreact",
          -- "typescriptreact",
          "less",
          "sass",
          "scss",
          "svelte",
          "pug",
          "vue",
        },
        init_options = {
          html = {
            options = {
              -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
              ["bem.enabled"] = true,
            },
          },
        },
      },
      -- Json
      jsonls = {},

      -- Markdown
      marksman = {
        filetypes = { "md" },
      },

      -- SQL
      sqlls = {},

      -- Javascript and Typescript
      -- config options: https://github.com/typescript-language-server/typescript-language-server/blob/master/docs/configuration.md
      tsserver = {
        completions = {
          completeFunctionCalls = true,
        },
        settings = {
          javascript = {
            format = {
              enable = true,
              baseIndentSize = 0,
              indentSize = 2,
              tabsize = 2,
              convertTabsToSpaces = true,
              semicolons = "insert",
              insertSpaceBeforeFunctionParenthesis = true,
            },
            -- inlayHints = {
            --   includefunctionLikeReturnTypes = true,
            --   includeInlayFunctionParameterTypeHints = true,
            -- },
          },
        },
      },

      eslint = {
        settings = {
          -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
          workingDirectories = { mode = "auto" }, -- Default
        },
      },

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
