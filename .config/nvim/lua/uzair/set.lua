local opt = vim.opt

opt.relativenumber = true
opt.nu = true
opt.cursorline = false
opt.linebreak = true
opt.showbreak = "+++"
opt.showmatch = true

opt.smartcase = true
opt.ignorecase = true
opt.autoindent = true
opt.expandtab = true
opt.smarttab = true
opt.ruler = true
opt.cindent = true
opt.wrap = false
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = -1
opt.list = true
opt.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"

opt.clipboard = "unnamedplus"

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

-- Better buffer splitting
opt.splitright = true
opt.splitbelow = true
