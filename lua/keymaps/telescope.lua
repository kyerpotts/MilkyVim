local builtin = require("telescope.builtin")
return {
  vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find Buffers" }),
  vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" }),
  vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" }),
  vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" }),
  vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" }),
  vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind [G]rep" }),
  vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = "[F]ind Recent ('.' for repeat)" }),
  vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind Resume" }),
  vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" }),
  vim.keymap.set("n", "<leader>ft", builtin.builtin, { desc = "[F]ind [T]elescope" }),
  vim.keymap.set("n", "<leader>/", function() builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
    previewer = false,
  }) end, { desc = "[F]ind [T]elescope" }),
  vim.keymap.set("n", "<leader>fc", function() builtin.find_files {
    cwd = vim.fn.stdpath "config",
  } end, { desc = "[F]ind Neovim [C]onfig" }),
  vim.keymap.set("n", "<leader>f/", function() builtin.live_grep {
    grep_open_files = true,
    prompt_title = "Live Grep in Open Files",
  } end, { desc = "[F]ind [/] in Open Files"})
}
