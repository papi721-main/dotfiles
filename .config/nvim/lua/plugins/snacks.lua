-- lazy.nvim
return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    picker = {
      -- your picker configuration comes here
      -- or leave it empty to use the default settings
      -- INFO: These are global settings, I added these here to show hidden and
      -- .gitignore files in the file explorer
      --
      hidden = false, -- for hidden files
      ignored = true, -- for .gitignore files

      -- INFO:
      -- I added the source configs below for showing hidden and .gitignore
      -- files in the fuzzy finder.
      -- You should also know that the explicit picker configuration for
      -- the source takes precedence over the global one above.
      --
      sources = {
        files = {
          hidden = true, -- for hidden files
          ignored = false, -- for .gitignore files
        },
      },
    },
  },
}
