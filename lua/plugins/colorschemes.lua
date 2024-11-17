return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "",  -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {
        },
        dim_inactive = false,
        transparent_mode = false,
      })
      -- vim.cmd("colorscheme gruvbox")
    end
  },
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
    -- priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "main",
        dark_variant = "main",
        dim_inactive_windows = true,
        styles = {
          bold = true,
          italic = true,
          transparency = false,
        }
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
      -- vim.cmd("colorscheme decay ")
    end,
  },
}
