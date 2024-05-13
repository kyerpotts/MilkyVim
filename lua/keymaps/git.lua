return {
  vim.keymap.set("n", "<leader>gg", "<cmd>:LazyGit<cr>", { desc = "Lazy[G]it" }),
  vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "[P]review Hunk" }),
  vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle [B]lame" }),
}
