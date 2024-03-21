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
			-- TODO: need to set up completion engines with snippets
			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "jdtls", "lemminx", "pyright", "ruff_lsp" },
			})
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			-- lspconfig.jdtls.setup({})
			-- lspconfig.lemminx.setup({})
			lspconfig.pyright.setup({})
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
				},
				automatic_installation = false,
				handlers = {},
			})
			require("null-ls").setup({
				sources = {
					require("null-ls").builtins.formatting.stylua,
					require("null-ls").builtins.formatting.black,
					require("null-ls").builtins.formatting.isort,
				},
			})
		end,
	},
}
