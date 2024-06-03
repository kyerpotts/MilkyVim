return {
	vim.keymap.set("n", "<leader>kg", "<cmd>Leet<cr>", { desc = "[G]o" }),
	vim.keymap.set("n", "<leader>km", "<cmd>Leet menu<cr>", { desc = "[M]enu" }),
	vim.keymap.set("n", "<leader>kx", "<cmd>Leet exit<cr>", { desc = "E[X]it" }),
	vim.keymap.set("n", "<leader>kt", "<cmd>Leet tabs<cr>", { desc = "[T]abs" }),
	vim.keymap.set("n", "<leader>ki", "<cmd>Leet info<cr>", { desc = "[I]nfo" }),
	vim.keymap.set("n", "<leader>kc", "<cmd>Leet console<cr>", { desc = "[C]onsole" }),
	vim.keymap.set("n", "<leader>kl", "<cmd>Leet lang<cr>", { desc = "[L]anguage" }),
	vim.keymap.set("n", "<leader>kr", "<cmd>Leet run<cr>", { desc = "[R]un" }),
	vim.keymap.set("n", "<leader>ks", "<cmd>Leet submit<cr>", { desc = "[S]ubmit" }),
	vim.keymap.set("n", "<leader>ky", "<cmd>Leet yank<cr>", { desc = "[Y]ank" }),
	vim.keymap.set("n", "<leader>kt", "<cmd>Leet list<cr>", { desc = "Lis[T]" }),
}
