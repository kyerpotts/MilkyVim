return {
	vim.keymap.set("n", "<leader>dc", function()
		require("dap").continue()
	end, { desc = "[C]ontinue (Start)" }),
	vim.keymap.set("n", "<leader>dso", function()
		require("dap").step_over()
	end, { desc = "[S]tep [O]ver" }),
	vim.keymap.set("n", "<leader>dsi", function()
		require("dap").step_into()
	end, { desc = "[S]tep [I]nto" }),
	vim.keymap.set("n", "<leader>dst", function()
		require("dap").step_out()
	end, { desc = "[S]tep Ou[T]" }),
	vim.keymap.set("n", "<Leader>db", function()
		require("dap").toggle_breakpoint()
	end, { desc = "[B]reakpoint" }),
	vim.keymap.set("n", "<Leader>lp", function()
		require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
	end, { desc = "[L]og [P]oint" }),
	vim.keymap.set("n", "<Leader>dr", function()
		require("dap").repl.open()
	end, { desc = "[R]epl" }),
	vim.keymap.set("n", "<Leader>dl", function()
		require("dap").run_last()
	end, { desc = "Run [L]ast" }),
	vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
		require("dap.ui.widgets").hover()
	end, { desc = "[H]over" }),
	vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
		require("dap.ui.widgets").preview()
	end, { desc = "[P]review" }),
	vim.keymap.set("n", "<Leader>df", function()
		local widgets = require("dap.ui.widgets")
		widgets.centered_float(widgets.frames)
	end, { desc = "[F]rames" }),
	vim.keymap.set("n", "<Leader>ds", function()
		local widgets = require("dap.ui.widgets")
		widgets.centered_float(widgets.scopes)
	end, { desc = "[S]copes" }),
}
