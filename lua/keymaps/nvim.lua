return {
  -- Remove search highlights with Escape
  vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>"),
  -- Move window focus
  vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" }),
  vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" }),
  vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" }),
  vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" }),
  vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" }),
  vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" }),
}
