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
}
