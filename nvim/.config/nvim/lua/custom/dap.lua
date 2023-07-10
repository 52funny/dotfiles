local dap = require("dap")

dap.adapters.delve = {
  type = "server",
  port = "${port}",
  executable = {
    command = "dlv",
    args = { "dap", "-l", "127.0.0.1:${port}" },
  }
}
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = '/Users/52funny/tmp/extension/adapter/codelldb',
    args = { "--port", "${port}" },
    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "${file}",
  },
  {
    type = "delve",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}"
  },
  -- works with go.mod packages and sub packages
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}"
  }
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}
dap.configurations.c = dap.configurations.cpp;
dap.configurations.rust = dap.configurations.cpp;

-- when typing commands in dap, don't show completion
-- refer: https://github.com/mfussenegger/nvim-dap/issues/562#issuecomment-1138546365
vim.api.nvim_set_var("copilot_filetypes", {
  ["dap-repl"] = false,
})
local dapui = require("dapui")
require("nvim-dap-virtual-text").setup({})

--#region
--
--
-- \begin{aligned}
--  x_1 = 1
--  x_2 = 2
-- \end{aligned}
local opts = { noremap = true, silent = true };
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, opts)
vim.keymap.set("n", "<leader>du", dapui.toggle, opts)
dapui.setup()
