---@diagnostic disable: param-type-mismatch
local M = {}
local lazy_util = require("lazy.core.util")

function M.git_blame()
  local gs = package.loaded.gitsigns

  if gs.toggle_current_line_blame() then
    lazy_util.info("Enabled git line blame", { title = "Option" })
  else
    lazy_util.warn("Disabled git line blame", { title = "Option" })
  end
end

function M.invisible_chars()
  vim.opt.list = not vim.opt.list:get()

  if vim.opt.list:get() then
    lazy_util.info("Enabled invisible characters", { title = "Option" })
  else
    lazy_util.warn("Disabled invisible characters", { title = "Option" })
  end
end

function M.mini_indent_scope()
  vim.g.miniindentscope_disable = not vim.g.miniindentscope_disable

  if vim.g.miniindentscope_disable then
    lazy_util.warn("Disabled mini indentscope", { title = "Option" })
  else
    lazy_util.info("Enabled mini indentscope", { title = "Option" })
  end
end
return M
