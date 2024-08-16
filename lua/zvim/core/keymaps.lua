-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
local opts = { noremap = true, silent = true }

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Navigate buffers
keymap.set("n", "<S-l>", ":bnext<CR>", opts)
keymap.set("n", "<S-h>", ":bprevious<CR>", opts)
keymap.set("n", "<leader>x", "<cmd>Bdelete!<CR>", opts)
keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Move text up and down
keymap.set("n", "<A-j>", "<Esc>:m .+1<CR>gv-gv", opts)
keymap.set("n", "<A-k>", "<Esc>:m .-2<CR>gv-gv", opts)

-- Visual --
-- Stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Move text up and down
keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)
keymap.set("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal
keymap.set("n", "<A-i>", "<cmd>ToggleTerm direction=float<CR>", opts)
keymap.set("n", "<A-h>", "<cmd>ToggleTerm size=20 direction=horizontal<CR>", opts)
keymap.set("n", "<A-v>", "<cmd>ToggleTerm size=60 direction=vertical<CR>", opts)
keymap.set("t", "<A-i>", "<cmd>ToggleTerm direction=float<CR>", opts)
keymap.set("t", "<A-h>", "<cmd>ToggleTerm size=20 direction=horizontal<CR>", opts)
keymap.set("t", "<A-v>", "<cmd>ToggleTerm size=60 direction=vertical<CR>", opts)
