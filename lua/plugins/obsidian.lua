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
		})
	end,
  -- TODO: configure obsidian
}
