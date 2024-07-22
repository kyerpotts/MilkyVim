return {
  "folke/which-key.nvim",
  event = "VeryLazy", -- Sets the loading event to 'VimEnter'
  opts = {
    preset = "classic",
    spec = {
      mode = { "n", "v" },
      { "<leader>a", group = "D[A]shboard" },
      { "<leader>b", group = "[B]uffer" },
      { "<leader>c", group = "[C]ode" },
      { "<leader>d", group = "[D]ebug" },
      { "<leader>e", group = "[E]xplorer" },
      { "<leader>f", group = "[F]ind" },
      { "<leader>g", group = "[G]it" },
      { "<leader>h", group = "[H]arpoon" },
      { "<leader>k", group = "Leet[K]ode" },
      { "<leader>l", group = "[L]anguage Tools" },
      { "<leader>L", group = "[L]azy" },
      { "<leader>M", group = "[M]ason" },
      { "<leader>o", group = "[O]bsidian" },
      { "<leader>r", group = "[R]ename" },
      { "<leader>t", group = "[T]est" },
      { "<leader>u", group = "[U]I" },
      { "<leader>x", group = "[X]trouble" },
    },
  },
  triggers = {
    { "<leader>", mode = { "n", "v" } },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
