local telescope = require("telescope.builtin")
local keybinds = {}
function keybinds.get_bindings()
  return {
    -- TODO: This will need to be updated to a new keybind when which-key is installed
    {
      "n",
      "K",
      vim.lsp.buf.hover,
      { desc = "Show lsp info on hover" },
    },
    {
      "n",
      "gd",
      telescope.lsp_definitions,
      { desc = "[G]oto [D]efinition" },
    },
    {
      "n",
      "gD",
      vim.lsp.buf.declaration,
      { desc = "[G]oto [D]eclaration" },
    },
    {
      "n",
      "gr",
      telescope.lsp_references,
      { desc = "[G]oto [R]eferences" },
    },
    {
      "n",
      "gI",
      telescope.lsp_implementations,
      { desc = "[G]oto [I]mplementations" },
    },
    -- { "n", "<leader>lds", telescope.lsp_document_symbols,          { desc = "[D]ocument [S]ymbols" } },
    -- { "n", "<leader>ws", telescope.lsp_dynamic_workspace_symbols, { desc = "[W]orkspace [S]ymbols" } },
    {
      "n",
      "<leader>ca",
      vim.lsp.buf.code_action,
      { desc = "List [C]ode [A]ctions" },
    },
    {
      "n",
      "<leader>ld",
      telescope.lsp_type_definitions,
      { desc = "Type [D]efinitions" },
    },
    -- {
    --   "n",
    --   "<leader>lf",
    --   vim.lsp.buf.format,
    --   { desc = "[F]ormat" },
    -- },
    {
      "n",
      "<leader>lr",
      vim.lsp.buf.rename,
      { desc = "[R]ename" },
    },
    {
      "n",
      "<leader>li",
      "<cmd>LspInfo<cr>",
      { desc = "[I]nfo" },
    },
    {
      "n",
      "<leader>lh",
      function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        if vim.lsp.inlay_hint.is_enabled() then
          vim.notify("Inlay hint enabled", vim.log.INFO)
        else
          vim.notify("Inlay hint disabled", vim.log.INFO)
        end
      end,
      { desc = "Inlay [H]int" },
    },
  }
end

return keybinds
