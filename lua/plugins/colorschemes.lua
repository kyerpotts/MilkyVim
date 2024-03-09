return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        styles = {
          commends = {"italic"},
          conditionals = { "italic" },
        },
        integrations = {
          cmp = true,
          nvimtree = true,
          treesitter = true,
          notify = true,
          mini = {
            enabled = true,
            indentscope_color = ""
          },
        },
      })
    end,
  },
  {
    "decaycs/decay.nvim",
    name = "decay",
    priority = 1000,
    config = function()
      require("decay").setup({
        style = "decayce",
        italics = {
          comments = true,
        },
      })
    end,
  },
}
