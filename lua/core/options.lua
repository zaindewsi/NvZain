local opt = vim.opt
local g = vim.g

--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- use filetype.lua instead of filetype.vim
g.did_load_filetypes = 0
g.do_filetype_lua = 1

opt.confirm = true
opt.laststatus = 3 -- global statusline
opt.title = true
opt.clipboard = "unnamedplus"
opt.cmdheight = 1
opt.cul = true -- cursor line

-- Indentline
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true

-- disable tilde on end of buffer: https://github.com/neovim/neovim/pull/8546#issuecomment-643643758
opt.fillchars = { eob = " " }

opt.hidden = true
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.relativenumber = false
opt.ruler = false

-- disable nvim intro
opt.shortmess:append "c"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 2
opt.termguicolors = true
opt.timeoutlen = 100
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250
opt.swapfile = false
opt.writebackup = false

opt.backup = false
opt.completeopt = { "menuone", "noselect" }
opt.conceallevel = 0
opt.fileencoding = "utf-8"
opt.hlsearch = true
opt.pumheight = 10
opt.showmode = false
opt.showtabline = 2
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8

-- disable some builtin vim plugins

local default_plugins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
}

for _, plugin in pairs(default_plugins) do
   g["loaded_" .. plugin] = 1
end
