return {
	vim.keymap.set("n", "<leader>ut", function()
		if require("twilight").enabled then
			vim.cmd("Twilight")
			vim.notify("Twilight On", vim.log.INFO)
		else
			vim.cmd("Twilight")
			vim.notify("Twilight Off", vim.log.INFO)
		end
	end, { desc = "[T]wilight" }),
	vim.keymap.set("n", "<leader>uz", function()
		if not require("zen-mode").is_open then
			require("zen-mode").toggle({})
			vim.notify("zenmode on", vim.log.info)
		else
			require("zen-mode").toggle({})
			vim.notify("zenmode off", vim.log.info)
		end
	end, { desc = "[Z]enmode" }),
	vim.api.nvim_set_keymap(
		"n",
		"<leader>un",
		"<cmd>Noice dismiss<cr>",
		{ desc = "Dismiss [N]otifications", noremap = true }
	),
}
