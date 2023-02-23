local g = vim.g
local o = vim.o
local opt = vim.opt

o.number = true
o.relativenumber = true
o.numberwidth = 2
o.cursorline = true
o.linebreak = true
o.showbreak = "+++"
o.showmatch = true
o.hlsearch = true
o.smartcase = true
o.ignorecase = true
o.incsearch = true
o.autoindent = true
o.expandtab = true
o.smarttab = true
o.ruler = true
o.clipboard = "unnamedplus"
o.termguicolors = true

-- Better editing experience
o.cindent = true
o.wrap = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = -1 -- If negative, shiftwidth value is used
o.list = true
o.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- Map <leader> to space
g.mapleader = " "
g.maplocalleader = " "

