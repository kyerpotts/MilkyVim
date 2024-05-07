return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      --"WhoIsSethDaniel/mason-tool-installer.nvim.nvim",
      { "folke/neodev.nvim", opts = {} },
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("milky-lsp-attach", { clear = true }),
        callback = function(event)
          -- Mapping hotkeys within the buffer the LSP is attached to
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

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })
      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "jdtls",
          "lemminx",
          "pyright",
          "clangd",
          "tsserver",
          "tailwindcss",
          "cssls",
          "eslint",
          "html",
        },
      })
      local lspconfig = require("lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
            diagnostics = { disable = { "missing-fields" } },
          },
        },
      })
      lspconfig.clangd.setup({})
      lspconfig.jdtls.setup({})
      lspconfig.lemminx.setup({})
      lspconfig.pyright.setup({})
      lspconfig.clangd.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.tailwindcss.setup({})
      lspconfig.eslint.setup({})
      lspconfig.html.setup({
        capabilities = capabilities,
      })
    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    opts = {},
    keys = {
      { "<leader>lv", "<cmd>VenvSelect<cr>", desc = "Select Python [V]irtual En[V]ironment" },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      -- require("mason").setup()
      require("mason-null-ls").setup({
        ensure_installed = {
          "stylua",
          "black",
          "isort",
          "prettierd",
        },
        automatic_installation = false,
        handlers = {},
      })
      require("null-ls").setup({
        sources = {
          require("null-ls").builtins.formatting.stylua,
          require("null-ls").builtins.formatting.black,
          require("null-ls").builtins.formatting.isort,
          require("null-ls").builtins.formatting.prettierd,
        },
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        "L3MON4D3/LuaSnip",
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
            return
          end
          return "make install_jsregexp"
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          {
            "rafamadriz/friendly-snippets",
            config = function()
              require("luasnip.loaders.from_vscode").lazy_load()
            end,
          },
        },
      },
      "saadparwaiz1/cmp_luasnip",

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "onsails/lspkind.nvim",
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      -- See `:help cmp`
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      luasnip.config.setup({})
      -- define kind_icons array like above
      local kind_icons = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        -- ... (remaining)
      }

      cmp.setup({
        formatting = {
          format = function(entry, vim_item)
            local lspkind_ok, lspkind = pcall(require, "lspkind")
            if not lspkind_ok then
              -- From kind_icons array
              vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
              -- Source
              vim_item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[LaTeX]",
              })[entry.source.name]
              return vim_item
            else
              -- From lspkind
              return lspkind.cmp_format()(entry, vim_item)
            end
          end,
        },

        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = "menu,menuone,noinsert" },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert({
          -- Select the [n]ext item
          ["<C-n>"] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          -- Scroll the documentation window [b]ack / [f]orward
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),

          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.
          ["<C-Space>"] = cmp.mapping.complete({}),

          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ["<C-l>"] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { "i", "s" }),
          ["<C-h>"] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { "i", "s" }),
          ["<C-j>"] = cmp.mapping(function ()
            if luasnip.choice_active() then
              luasnip.change_choice(1)
            end
          end, { "i", "s" }),
          -- TODO: check whether this needs to be fixed at a later date
          -- vim.keymap.set({ "i", "s" }, "<C-E>", function()
          --   if luasnip.choice_active() then
          --     luasnip.change_choice(1)
          --   end
          -- end, { silent = true }),
          -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
          --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        },
      })
    end,
  },
}
