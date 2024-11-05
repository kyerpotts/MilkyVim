return {
  "echasnovski/mini.nvim",
  config = function()
    require("mini.ai").setup({ n_lines = 500 })
    require("mini.surround").setup()
    -- require("mini.animate").setup()
    require("mini.indentscope").setup({
      options = {
        try_as_border = true,
      },
    })

    vim.api.nvim_create_autocmd({ "FileType" }, {
      desc = "Disable indentscope for certain filetypes",
      callback = function()
        local ignore_filetypes = {
          "alpha",
          "aerial",
          "dashboard",
          "help",
          "lazy",
          "leetcode.nvim",
          "mason",
          "neo-tree",
          "NvimTree",
          "neogitstatus",
          "notify",
          "startify",
          "toggleterm",
          "Trouble",
        }
        if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
          vim.b.miniindentscope_disable = true
          vim.b.minianimate_disable = true
        end
      end,
    })
    -- vim.api.nvim_create_autocmd("FileType", {
    -- 	group = vim.api.nvim_create_augroup("milky-disable-indentscope", { clear = true }),
    -- 	pattern = {
    -- 		"help",
    -- 		"alpha",
    -- 		"dashboard",
    -- 		"neo-tree",
    -- 		"trouble",
    -- 		"trouble",
    -- 		"lazy",
    -- 		"mason",
    -- 		"notify",
    -- 		"toggleterm",
    -- 		"lazyterm",
    -- 	},
    -- 	callback = function()
    -- 		vim.b.miniindentscope_disable = true
    -- 	end,
    -- })
  end,
}
