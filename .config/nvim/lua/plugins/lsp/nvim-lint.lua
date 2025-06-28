return {
  "mfussenegger/nvim-lint",
  opts = {
    linters = {
      sqlfluff = {
        args = {
          "lint",
          "--format=json",
          -- note: users will have to replace the --dialect argument accordingly
          -- This line didn't work with me, but adding a .sqlfluff at
          -- the root of the project did.
          -- check https://docs.sqlfluff.com/en/stable/configuration/default_configuration.html#defaultconfig
          -- "--dialect=mysql",
        },
      },
    },
  },
}
