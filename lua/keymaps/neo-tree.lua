return {
  vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle reveal_force_cwd<cr>"),
  vim.keymap.set("n", "<leader>g", "<cmd>Neotree %:p:h toggle float git_status<cr>"),
}
