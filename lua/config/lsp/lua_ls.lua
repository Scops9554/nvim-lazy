-- ~/.config/nvim/lua/custom/lua_ls.lua
local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT", -- Love2D uses LuaJIT
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        globals = { "love" }, -- recognize 'love' global
        disable = { "lowercase-global" },
      },
      workspace = {
        library = {
          vim.fn.expand("~/.local/share/LuaAddons"), -- your addons path
        },
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
