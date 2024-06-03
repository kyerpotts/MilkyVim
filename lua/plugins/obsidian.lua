return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		require("obsidian").setup({
			workspaces = {
				{
					name = "Braincage",
					path = "/home/squidmilk/Documents/Braincage",
				},
			},
			templates = {
				folder = "007 Templates",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M",
			},
		})
	end,
	-- TODO: configure obsidian
}
