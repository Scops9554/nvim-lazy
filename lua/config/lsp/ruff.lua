local lspconfig = require("lspconfig")

lspconfig.ruff_lsp.setup({
  init_options = {
    settings = {
      args = {
        "--config",
        vim.fn.expand("~/.config/nvim/ruff.toml"),
      },
    },
  },
})
