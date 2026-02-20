-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("lspconfig")

-- Load custom lsp configs
require("config.lsp.lua_ls")
require("config.lsp.rust-analyzer")
require("config.lsp.ruff")

vim.opt.mouse = "n"
