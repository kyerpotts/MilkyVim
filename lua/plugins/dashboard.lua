return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      local logo = [[
█                                                                        █
█                                                                      █
█        ████ ██████           █████      ██                     █
█       ███████████             █████                             █
█       █████████ ███████████████████ ███   ███████████   █
█      █████████  ███    █████████████ █████ ██████████████   █
█     █████████ ██████████ █████████ █████ █████ ████ █████   █
█   ███████████ ███    ███ █████████ █████ █████ ████ █████  █
█  ██████  █████████████████████ ████ █████ █████ ████ ██████ █
█                                                                        █
    ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
          -- stylua: ignore
          center = {
            { action = "Leet", desc = " Leetcode", icon = " ", key = "l" },
            { action = "ene | startinsert", desc = " New file", icon = " ", key = "n" },
            { action = "cd $HOME/ | Telescope find_files", desc = " Find file", icon = " ", key = "f" },
            { action = "Telescope oldfiles", desc = " Recent files", icon = "󰱼 ", key = "r" },
            { action = "Telescope live_grep", desc = " Find text", icon = " ", key = "g" },
            {
              action = "cd $HOME/Documents/Braincage/ | ObsidianQuickSwitch",
              desc = " Obsidian",
              icon = " ",
              key = "o"
            },
            { action = "cd $HOME/.config/nvim/ | Telescope find_files", desc = " Config", icon = " ", key = "c" },
            { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "L" },
            { action = "lua require('lazy').sync()", desc = " Update Plugins", icon = " ", key = "u" },
            { action = "Mason", desc = " Mason", icon = " ", key = "M" },
            { action = "qa", desc = " Quit", icon = " ", key = "q" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return {
              "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
            }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- Set highlights for headings
      local colors = require("decay.core").get_colors("decayce")
      vim.api.nvim_set_hl(0, "DashboardHeader", { fg = colors.brightcyan })
      vim.api.nvim_set_hl(0, "DashboardFooter", { fg = colors.orange })
      vim.api.nvim_set_hl(0, "DashboardIcon", { fg = colors.cyan })
      vim.api.nvim_set_hl(0, "DashboardKey", { fg = colors.green })
      vim.api.nvim_set_hl(0, "DashboardDesc", { fg = colors.magenta })

      -- local colors = require("rose-pine.palette")
      -- vim.api.nvim_set_hl(0, "DashboardHeader", { fg = colors.gold })
      -- vim.api.nvim_set_hl(0, "DashboardFooter", { fg = colors.love })
      -- vim.api.nvim_set_hl(0, "DashboardIcon", { fg = colors.love })
      -- vim.api.nvim_set_hl(0, "DashboardKey", { fg = colors.pine })
      -- vim.api.nvim_set_hl(0, "DashboardDesc", { fg = colors.text })

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },
}
