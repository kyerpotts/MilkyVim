return {
  "mfussenegger/nvim-dap",
  dependencies = {
    { "rcarriga/nvim-dap-ui",            dependencies = { "nvim-neotest/nvim-nio" } },
    { "theHamsta/nvim-dap-virtual-text", opts = {} },
    { "williamboman/mason.nvim",         "jay-babu/mason-nvim-dap.nvim" },
    {
      "mfussenegger/nvim-dap-python",
      ft = "python",
      keys = {
        {
          mode = "n",
          "<leader>dm",
          function()
            require("dap-python").test_method()
          end,
          desc = "Test [M]ethod"
        },
      },
      config = function()
        require("dap-python").setup("python")
        require("dap-python").test_runner = "pytest"
      end
    }
  },
  config = function()
    require("dapui").setup()
    local dap, dapui = require("dap"), require("dapui")
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
}
