local function indentation()
  local expandtab = vim.api.nvim_get_option_value("expandtab", { scope = "local" })
  local tabstop = vim.api.nvim_get_option_value("tabstop", { scope = "local" })

  if expandtab then
    return "spaces: " .. tabstop
  else
    return "tabs: " .. tabstop
  end
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    table.insert(opts.sections.lualine_x, indentation)
  end,
}
