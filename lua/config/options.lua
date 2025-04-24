-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Enable nerd font
vim.g.have_nerd_font = true

-- Set clipboard
vim.opt.clipboard = 'unnamedplus'

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Wrapping
vim.opt.wrap = false

-- Backup/Swap/Undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.undofile = true

-- Mouse mode
vim.opt.mouse = 'a'

-- UI settings
vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes' -- Keep signcolumn on by default
vim.opt.cursorline = true
vim.opt.guicursor = '' -- Use system cursor shape

-- Indentation
vim.opt.breakindent = true

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true -- Set highlight on search

-- Performance
vim.opt.updatetime = 250 -- Decrease update time
vim.opt.timeoutlen = 300 -- Decrease mapped sequence wait time

-- Window splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Live substitution preview
vim.opt.inccommand = 'split'

-- Scrolling offset
vim.opt.scrolloff = 10
