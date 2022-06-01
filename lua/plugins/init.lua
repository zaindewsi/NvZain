local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
   PACKER_BOOTSTRAP = fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
   }
   print "Installing packer close and reopen Neovim..."
   vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost ~/.config/nvim/lua/plugins/init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
   return
end

-- Have packer use a popup window
packer.init {
   display = {
      open_fn = function()
         return require("packer.util").float { border = "rounded" }
      end,
   },
}

-- Install your plugins here
return packer.startup(function(use)
   use "wbthomason/packer.nvim" -- Have packer manage itself

   -- colorscheme
   use { "catppuccin/nvim", as = "catppuccin" }

   -- Treesitter
   use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = "require('plugins.treesitter')",
   }
   use "windwp/nvim-ts-autotag"
   use "p00f/nvim-ts-rainbow"
   use {
      "windwp/nvim-autopairs",
      config = "require('plugins.autopairs')",
   }

   -- File tree
   use {
      "kyazdani42/nvim-tree.lua",
      requires = {
         "kyazdani42/nvim-web-devicons", -- optional, for file icon
      },
      config = "require ('plugins.nvim-tree')",
   }

   -- status lines
   use {
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
      config = "require ('plugins.lualine')",
   }
   use {
      "akinsho/bufferline.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = "require('plugins.bufferline')",
   }
   use "moll/vim-bbye"

   -- Automatically set up your configuration after cloning packer.nvim
   if PACKER_BOOTSTRAP then
      require("packer").sync()
   end
end)
