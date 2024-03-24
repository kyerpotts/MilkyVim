local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():append()
end, { desc = "[H]arpoon add" })
vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<C-1>", function()
	harpoon:list():select(1)
end, { desc = "Harpoon 1" })
vim.keymap.set("n", "<C-2>", function()
	harpoon:list():select(2)
end, { desc = "Harpoon 2" })
vim.keymap.set("n", "<C-3>", function()
	harpoon:list():select(3)
end, { desc = "Harpoon 3" })
vim.keymap.set("n", "<C-4>", function()
	harpoon:list():select(4)
end, { desc = "Harpoon 4" })
vim.keymap.set("n", "<C-5>", function()
	harpoon:list():select(5)
end, { desc = "Harpoon 5" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>hp", function()
	harpoon:list():prev()
end, { desc = "[H]arpoon [P]revious" })
vim.keymap.set("n", "<leader>hn", function()
	harpoon:list():next()
end, { desc = "[H]arpoon [N]ext" })