return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Defining diagnostic errors - this could be remapped to LSP later
    -- vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
    -- vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
    -- vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
    -- vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
    require("neo-tree").setup({
      close_if_last_window = false,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      enable_normal_mode_for_inputs = false,
      open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
      sort_case_insensitive = true,
      name = {
        use_git_status_colors = true,
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hid_gitignored = true,
        },
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      hijack_netrw_behaviour = "open_default",
      use_libuv_file_watcher = true,
      source_selector = {
        winbar = true,
      }
    })
  end,
}
