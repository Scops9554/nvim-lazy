-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

--load lsp configs
require("config.lsp.lua_ls")
require("config.lsp.ruff")
require("config.lsp.rust-analyzer")
