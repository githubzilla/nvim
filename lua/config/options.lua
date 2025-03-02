local opt = vim.opt

-- Basic settings
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.mouse = "nvi"
opt.smartcase = true
opt.ignorecase = true
opt.syntax = "on"

-- Cursor and visual
opt.guicursor = "a:blinkon100"
vim.cmd("hi Visual term=reverse cterm=reverse guibg=Grey")

-- Indent settings
opt.filetype = "on"
vim.cmd("filetype indent on")
vim.cmd("filetype plugin indent on")

-- Swap file behavior
vim.cmd([[autocmd SwapExists * let v:swapchoice = "o"]])

-- Additional settings
opt.hidden = true
opt.backup = false
opt.writebackup = false
opt.cmdheight = 2
opt.updatetime = 300
opt.shortmess:append("c") 