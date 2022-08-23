local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not status_ok then
   return
end

local options = {
   ensure_installed = {
      "lua",
      "vim",
      "html",
      "css",
      "comment",
      "javascript",
      "json",
      "php",
      "scss",
      "tsx",
      "typescript",
      "prisma",
   },
   highlight = {
      enable = true,
      use_languagetree = true,
   },
   autotag = {
      enable = true,
   },
   rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
   },
   autopairs = {
      enable = true,
   },
   context_commentstring = {
      enable = true,
      enable_autocmd = false,
   },
}

treesitter.setup(options)
