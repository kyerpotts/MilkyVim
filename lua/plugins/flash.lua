return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {
		modes = {
			char = {
				jump_labels = true,
			},
			search = {
				enabled = true,
			},
		},
	},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
    { "r", mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
    { "R", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    -- {
    --   "<c-s>",
    --   mode = { "n", "c" },
    --   function()
    --     require("flash").toggle()
    --     if require("flash").search.enabled then
    --       vim.notify("Flash search enabled", vim.log.INFO)
    --     else
    --       vim.notify("Flash search disabled", vim.log.INFO)
    --     end
    --   end,
    --   desc = "Toggle Flash Search"
    -- },
  },
}
