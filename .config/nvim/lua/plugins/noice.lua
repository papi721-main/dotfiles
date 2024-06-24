return {
  "folke/noice.nvim",
  opts = {
    messages = {
      enabled = true,
    },
    cmdline = {
      enabled = true,
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "echomsg",
        },
        opts = { skip = true },
      },
    },
  },
}
