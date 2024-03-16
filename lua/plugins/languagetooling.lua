return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    --"WhoIsSethDaniel/mason-tool-installer.nvim.nvim",
    { "folke/neodev.nvim", opts = {} },
    { "j-hui/fidget.nvim", opts = {} },
  },
  { "linux-cultist/venv-selector.nvim", opts = {},
    keys = {
      { "<leader>lv", "<cmd>VenvSelect<cr>", { desc = "Select Python [V]irtual En[V]ironment" } }
    },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("milky-lsp-attach", { clear = true }),
      callback = function(event)

        local map = function(mode, keys, func, opts)
          opts = vim.tbl_extend("force", opts, { buffer = event.buf })
          vim.keymap.set(mode, keys, func, opts)
        end

        local lspkeymaps = require("keymaps.lsp")
        local bindings = lspkeymaps.get_bindings()
        for _, bind in ipairs(bindings) do
          local mode, keys, func, opts = unpack(bind)
          map(mode, keys, func, opts)
        end
      end,
    })

    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "jdtls", "lemminx", "pyright", "ruff_lsp"},
    })
    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup({})
    lspconfig.jdtls.setup({})
  end,
}
