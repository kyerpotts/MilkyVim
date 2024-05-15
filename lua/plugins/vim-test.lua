return {
	"vim-test/vim-test",
	dependencies = {
		"preservim/vimux",
	},
	vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>", { desc = "[T]est Neares[T]", silent = true }),
	vim.keymap.set("n", "<leader>tf", ":TestFile<CR>", { desc = "[T]est [F]ile", silent = true }),
	vim.keymap.set("n", "<leader>ta", ":TestSuite<CR>", { desc = "[T]est [A]ll", silent = true }),
	vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", { desc = "[T]est [L]ast", silent = true }),
	vim.keymap.set("n", "<leader>tg", ":TestVisit<CR>", { desc = "[T]est [V]isit", silent = true }),
  vim.cmd("let test#strategy = 'vimux'")
}
