-- Map leader key, put this in keybinds when the config allows
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.opt.mouse = "a"
vim.opt.timeoutlen = 300
vim.opt.updatetime = 300


-- set up numbering
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.inccommand = "split"
-- vim.opt.list = true
-- vim.opt.listchars = { tab = "» ", trail = "·", nbsp = '␣' }

-- Setting up indentation
-- vim.opt.autoindent = true
-- vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.hlsearch = true
vim.opt.cursorline = true
-- vim.opt.showmatch = true

-- Make sure there is nowrap
vim.opt.wrap = false

-- New panes should open below or to the right
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.clipboard = "unnamedplus"

-- vim.opt.scrolloff = 20

-- Change visual block mode to allow longer selections
vim.opt.virtualedit = "block"

-- Vim command auto-completion can be case insensitive
vim.opt.ignorecase = true

-- Enables proper colors
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"

vim.opt.swapfile = false

vim.opt.title = true
vim.opt.titlestring = "Neovim - %t"
vim.opt.undofile = true

vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
