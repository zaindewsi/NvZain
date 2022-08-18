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
   use "nvim-lua/plenary.nvim"
   use {
      "numToStr/Comment.nvim",
      tag = "v0.6.1",
      config = function()
         require "plugins.comment"
      end,
   } -- Easily comment stuff
   use {
      "akinsho/toggleterm.nvim",
      config = function()
         require "plugins.toggleterm"
      end,
   }
   use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
         require "plugins.indent-blankline"
      end,
   }
   use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight

   -- colorscheme
   use { "catppuccin/nvim", as = "catppuccin" }
   use "folke/tokyonight.nvim"

   use {
      "goolord/alpha-nvim",

      config = function()
         require "plugins.alpha"
      end,
   }

   -- Treesitter
   use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
         require "plugins.treesitter"
      end,
   }
   use "windwp/nvim-ts-autotag"
   use {
      "windwp/nvim-autopairs",
      config = function()
         require "plugins.autopairs"
      end,
   }
   use "JoosepAlviste/nvim-ts-context-commentstring"
   use "p00f/nvim-ts-rainbow"
   use {
      "norcalli/nvim-colorizer.lua",
      config = function()
         require("colorizer").setup()
      end,
   }

   -- File tree
   use {
      "kyazdani42/nvim-tree.lua",
      requires = {
         "kyazdani42/nvim-web-devicons",
      },
      config = function()
         require "plugins.nvim-tree"
      end,
   }

   -- Telescope
   use {
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/plenary.nvim" } },
      config = function()
         require "plugins.telescope"
      end,
   }

   -- status lines
   use {
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
      config = function()
         require "plugins.lualine"
      end,
   }
   use {
      "akinsho/bufferline.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
         require "plugins.bufferline"
      end,
   }
   use "moll/vim-bbye"

   -- LSP
   use {
      "neovim/nvim-lspconfig",
      config = function()
         require "plugins.lsp"
      end,
   }
   use "williamboman/nvim-lsp-installer" -- simple to use language server installer
   use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
   use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
   use "b0o/SchemaStore.nvim" -- jsonls

   -- cmp plugins
   use "hrsh7th/nvim-cmp" -- The completion plugin
   use "hrsh7th/cmp-buffer" -- buffer completions
   use "hrsh7th/cmp-path" -- path completions
   use "hrsh7th/cmp-cmdline" -- cmdline completions
   use "saadparwaiz1/cmp_luasnip" -- snippet completions
   use "hrsh7th/cmp-nvim-lsp"

   -- snippets
   use "L3MON4D3/LuaSnip" --snippet engine
   use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

   -- Git
   use {
      "lewis6991/gitsigns.nvim",
      config = function()
         require "plugins.gitsigns"
      end,
   }

   -- Automatically set up your configuration after cloning packer.nvim
   if PACKER_BOOTSTRAP then
      require("packer").sync()
   end
end)
