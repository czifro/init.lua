vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.guicursor = ''

vim.opt.nu = true
vim.opt.relativenumber = true

vim.o.colorcolumn = "65,80"

vim.o.mouse = 'a'

vim.o.clipboard = 'unnamedplus'

vim.o.breakindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.colorcolumn = '80'

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.completeopt = 'menuone,noselect'
vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')

vim.opt.updatetime = 50
vim.opt.timeout = true
vim.opt.timeoutlen = 2000

vim.g.color = 'spacegray'
