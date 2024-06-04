--[[
==============================================================================
Auto completion
==============================================================================
nvim-cmp: a completion plugin for neovim coded in Lua.

When adding sources:
  1. first include the source plugin repo in the `dependencies` key
  2. then include the source name in the `sources` key
--]]

local icons = require("utils.cmp_util").kind_icons
local window_opts = require("utils.cmp_util").window_opts

return {
  "hrsh7th/nvim-cmp",
  version = false, -- last release is way too old
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
  },
  opts = function()
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local cmp = require("cmp")
    local defaults = require("cmp.config.default")()
    return {
      -- Not all LSP servers add brackets when completing a function.
      -- To better deal with this, LazyVim adds a custom option to cmp,
      -- that you can configure. For example:
      --
      -- ```lua
      -- opts = {
      --   auto_brackets = { "python" }
      -- }
      -- ```
      auto_brackets = {}, -- configure any filetype to auto add brackets
      completion = {
        completeopt = "menu,menuone,noinsert", -- LazyVim config
        -- NOTE: My old config
        -- completeopt = "menu,menuone,noinsert,noselect",
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.select_next_item({}),
        ["<C-k>"] = cmp.mapping.select_prev_item({}),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),

        -- My CR and S-CR
        -- ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        -- ["<S-CR>"] = cmp.mapping.confirm({
        --   behavior = cmp.ConfirmBehavior.Replace,
        --   select = true,
        -- }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

        -- LazyVim CR and S-CR
        ["<CR>"] = LazyVim.cmp.confirm(),
        ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
      }),

      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
      }, {
        { name = "buffer" },
        { name = "emoji" },
      }),
      -- My formatting
      -- formatting = {
      --   fields = { "kind", "abbr", "menu" },
      --   format = function(entry, item)
      --     -- Kind icons
      --     item.kind = string.format("%s", icons[item.kind])
      --     item.menu = ({
      --       nvim_lsp = "[LSP]",
      --       -- luasnip = "[Snippet]",
      --       buffer = "[Buffer]",
      --       path = "[Path]",
      --     })[entry.source.name]
      --     return item
      --   end,
      -- },

      -- LazyVim formatting
      formatting = {
        format = function(_, item)
          local icons = require("lazyvim.config").icons.kinds
          if icons[item.kind] then
            item.kind = icons[item.kind] .. item.kind
          end
          return item
        end,
      },
      window = {
        completion = cmp.config.window.bordered(window_opts),
        documentation = cmp.config.window.bordered(window_opts),
      },
      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
        },
      },
      sorting = defaults.sorting,
    }
  end,
}
