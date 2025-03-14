-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- [[ Tabs / Indentation ]]
-- opt.tabstop = 4 -- Number of spaces a <Tab> counts for
-- opt.shiftwidth = 0 -- Number of spaces to use for each space of autoindent
-- opt.softtabstop = 4 -- Number of spaces that a <Tab> counts for while performing editing operations
-- opt.expandtab = true -- Expand tabs to spaces
-- opt.shiftround = true -- Rounds indent to multiple of `shiftwidth`, applies to > and <
-- opt.smartindent = true -- automatic indenting

-- [[ Formatting ]]
opt.textwidth = 79
opt.colorcolumn = "+1"

-- [[ Folding ]]
-- Comment this lines to use LazyVim's default fold options
-- opt.foldmethod = "marker" -- use zf to create a fold-marker
-- opt.foldclose = "all" -- a fold is closed when a cursor isn't in it

-- [[ Appearance ]]
opt.list = true -- Show some invisible characters (tabs...
opt.listchars = {
  tab = "➛ ",
  trail = "·",
  nbsp = "+",
}
opt.cursorline = true -- Enable highlighting of the current line

-- [[ Misc ]]
-- LSP Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = "pyright"
