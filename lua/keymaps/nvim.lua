return {
  -- Remove search highlights with Escape
  vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>"),
  -- Move window focus
  -- vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" }),
  vim.keymap.set("n", "+", "<C-a>", { desc = "Increment numbers" }),
  vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement numbers" }),
  vim.keymap.set("v", "+", "<C-a>gv", { desc = "Increment numbers" }),
  vim.keymap.set("v", "-", "<C-x>gv", { desc = "Decrement numbers" }),
  vim.keymap.set("n", "G", "Gzz"),
  vim.keymap.set("n", "j", "gjzz"),
  vim.keymap.set("n", "k", "gkzz"),
  vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "Move focus to the left window" }),
  vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", { silent = true }),
  vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { desc = "Move focus to the lower window" }),
  vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", { silent = true }),
  vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { desc = "Move focus to the upper window" }),
  vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", { silent = true }),
  vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "Move focus to the right window" }),
  vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", { silent = true }),
  vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" }),
  vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" }),
  vim.keymap.set("n", "<leader>M", "<cmd>Mason<CR>", { desc = "[M]ason" }),
  vim.keymap.set("n", "<leader>L", "<cmd>Lazy<CR>", { desc = "[L]azy" }),
  vim.keymap.set("n", "<leader>a", "<cmd>Dashboard<CR>", { desc = "D[A]shboard" }),
  vim.keymap.set("n", "<leader>bc", "<cmd>bnext<CR><cmd>bd #<CR>", { desc = "[B]uffer [C]lose" }),
  vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" }),
  vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" }),
  vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" }),
  vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" }),
  vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" }),
  vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" }),
}
