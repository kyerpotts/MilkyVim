-- Map leader key, put this in keybinds when the config allows
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.opt.mouse = "a"

-- set up numbering
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.inccommand = "split"

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

vim.opt.scrolloff = 999

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
