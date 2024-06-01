return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependecies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"c",
				"cmake",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"python",
				"toml",
				"c_sharp",
				"java",
				"elixir",
				"heex",
				"javascript",
				"typescript",
				"tsx",
				"rust",
				"bash",
				"html",
				"css",
			},
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			sync_install = false,
			ignore_install = {},
		})
	end,
}
