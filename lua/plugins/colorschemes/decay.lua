return {
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
}
