return {
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
}
