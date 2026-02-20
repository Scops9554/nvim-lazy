return {
  {
    "mfussenegger/nvim-dap",
    opts = function(_, opts)
      local dap = require("dap")

      -- Get mason path
      local mason_path = vim.fn.stdpath("data") .. "/mason/"
      local debugpy_path = mason_path .. "packages/debugpy/venv/bin/python"

      dap.adapters.python = {
        type = "executable",
        command = debugpy_path,
        args = { "-m", "debugpy.adapter" },
      }

      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          pythonPath = function()
            return vim.fn.exepath("python3") or "python"
          end,
        },
      }
    end,
    "mfussenegger/nvim-dap-python",
    ft = "python",
    config = function()
      local mason_path = vim.fn.stdpath("data") .. "/mason/"
      local debugpy_path = mason_path .. "packages/debugpy/venv/bin/python"

      require("dap-python").setup(debugpy_path)
    end,
  },
}
