local trouble = require("trouble")
return {
  vim.keymap.set("n", "<leader>xx", function()
    trouble.toggle()
  end, { desc = "References" }),
  vim.keymap.set("n", "<leader>xq", function()
    trouble.toggle("quickfix")
  end, { desc = "[Q]uickfix" }),
  vim.keymap.set("n", "<leader>xr", function()
    trouble.toggle("lsp_references")
  end, { desc = "References" }),
}
