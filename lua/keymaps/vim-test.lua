return {
	vim.keymap.set("n", "<leader>tt", "<cmd>TestNearest<cr>", { desc = "[T]est Neares[T]", silent = true }),
	vim.keymap.set("n", "<leader>tf", "<cmd>TestFile<cr>", { desc = "[T]est [F]ile", silent = true }),
	vim.keymap.set("n", "<leader>ta", "<cmd>TestSuite<cr>", { desc = "[T]est [A]ll", silent = true }),
	vim.keymap.set("n", "<leader>tl", "<cmd>TestLast<cr>", { desc = "[T]est [L]ast", silent = true }),
	vim.keymap.set("n", "<leader>tg", "<cmd>TestVisit<cr>", { desc = "[T]est [V]isit", silent = true }),
}
