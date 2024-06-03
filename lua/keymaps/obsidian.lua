return {
	vim.keymap.set("n", "<leader>oi", function()
		local file_path = "/home/squidmilk/Documents/Braincage/! Inbox/"
			.. vim.fn.input("Enter a note name: ", "", "file") .. ".md"
		if vim.fn.empty(vim.fn.glob(file_path)) > 0 then
			vim.cmd("silent! !mkdir -p " .. vim.fn.fnamemodify(file_path, ":h"))
			vim.cmd("silent! !touch " .. file_path)
		end
		vim.cmd("edit " .. file_path)
		-- if require("twilight").enabled then
		-- 	vim.cmd("Twilight")
		-- 	vim.notify("Twilight On", vim.log.INFO)
		-- else
		-- 	vim.cmd("Twilight")
		-- 	vim.notify("Twilight Off", vim.log.INFO)
		-- end
	end, { desc = "Add [I]nbox Note" }),
}
