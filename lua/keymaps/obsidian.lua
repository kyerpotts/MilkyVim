return {
	vim.keymap.set("n", "<leader>oi", function()
		local file_path = "/home/squidmilk/Documents/Braincage/! Inbox/"
			.. vim.fn.input("Enter a note name: ", "", "file")
			.. ".md"
		if vim.fn.empty(vim.fn.glob(file_path)) > 0 then
			vim.cmd("silent! !mkdir -p " .. vim.fn.fnamemodify(file_path, ":h"))
			vim.cmd("silent! !touch " .. file_path)
		end
		vim.cmd("edit " .. file_path)
	end, { desc = "Add [I]nbox Note" }),
	vim.keymap.set("n", "<leader>ot", function()
		local file_path = require("obsidian").daily_note_path
		if vim.fn.empty(vim.fn.glob(file_path)) > 0 then
			vim.cmd("silent! !mkdir -p " .. vim.fn.fnamemodify(file_path, ":h"))
			vim.cmd("silent! !touch " .. file_path)
		end
    vim.fn.input("Enter a task: ", "", "file")
	end, { desc = "Add [T]ask" }),
}
