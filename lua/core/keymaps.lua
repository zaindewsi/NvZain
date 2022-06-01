local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Edit config
keymap("n", "<leader>E", ":e ~/.config/nvim/init.lua<cr>", opts)

-- Format document
keymap("n", "<leader>fm", "<cmd>Format<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>x", "<cmd>Bdelete!<CR>", opts)
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>gv-gv", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>gv-gv", opts)

-- Nvim Tree
keymap("n", "<C-n>", "<cmd> NvimTreeToggle <CR>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd> Telescope find_files <CR>", opts)
keymap("n", "<leader>fw", "<cmd> Telescope live_grep <CR>", opts)
keymap("n", "<leader>fb", "<cmd> Telescope buffers <CR>", opts)
keymap("n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal
keymap("n", "<A-i>", "<cmd>ToggleTerm direction=float<CR>", opts)
keymap("n", "<A-h>", "<cmd>ToggleTerm size=20 direction=horizontal<CR>", opts)
keymap("n", "<A-v>", "<cmd>ToggleTerm size=60 direction=vertical<CR>", opts)
keymap("t", "<A-i>", "<cmd>ToggleTerm direction=float<CR>", opts)
keymap("t", "<A-h>", "<cmd>ToggleTerm size=20 direction=horizontal<CR>", opts)
keymap("t", "<A-v>", "<cmd>ToggleTerm size=60 direction=vertical<CR>", opts)
