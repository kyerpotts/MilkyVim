return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          keywords = { "italic" },
        },
        integrations = {
          cmp = true,
          nvimtree = true,
          treesitter = true,
          notify = true,
          mini = {
            enabled = true,
            -- indentscope_color = "",
          },
        },
        -- vim.cmd.colorscheme('catppuccin')
      })
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "main",
        dark_variant = "main",
        dim_inactive_windows = true,
      })
      vim.cmd("colorscheme rose-pine")
    end,
  },
  {
    {
      "maxmx03/fluoromachine.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        local fm = require("fluoromachine")

        fm.setup({
          glow = false,
          -- theme = "fluoromachine",
          -- theme = "retrowave",
          theme = "delta",
          transparent = "false",
          -- brightness = 0.05,
          overrides = {
            ['@type'] = { italic = true, bold = true },
            ['@comment'] = { italic = true },
            ['@keyword'] = { italic = true },
            ['@function'] = { italic = true, bold = true },
          }
        })
      end,
    },
  },
  {
    "decaycs/decay.nvim",
    name = "decay",
    -- priority = 1000,
    config = function()
      local style = "decayce"
      local colors = require("decay.core").get_colors(style)
      require("decay").setup({
        style = style,
        italics = {
          code = true,
          comments = true,
        },
        cmp = {
          block_kind = false,
        },
        nvim_tree = {
          contrast = true,
        },
        override = {
          ["@punctuation.bracket"] = { fg = colors.red },
          Whitespace = { fg = colors.black },
          MatchParen = { fg = colors.background, bg = colors.brightgreen },
          Substitute = { fg = colors.yellow, bg = colors.background },
          Nontext = { fg = colors.brightblack },
          LspReferenceRead = { bg = colors.brightblack },
          LspReferenceWrite = { bg = colors.brightblack },
          LspReferenceText = { bg = colors.brightblack },
          FloatBorder = { fg = colors.black, bg = colors.background },
        },
      })
      -- vim.cmd.colorscheme("fluoromachine")
    end,
  },
}
