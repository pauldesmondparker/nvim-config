return {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
        disable = { 'missing-fields' },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
