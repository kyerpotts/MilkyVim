return {
	vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "[X]Diagnostics" }),
	-- vim.keymap.set("n", "<leader>xx", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfi[X] List" }),
	-- vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "[L]ocation List" }),
	vim.keymap.set(
		"n",
		"<leader>cl",
		"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		{ desc = "[L]SP Definitions / references / ... (Trouble)" }
	),
	vim.keymap.set(
		"n",
		"<leader>cs",
		"<cmd>Trouble symbols toggle focus=false<cr>",
		{ desc = "Symbols (Trouble)" }
	),
}
