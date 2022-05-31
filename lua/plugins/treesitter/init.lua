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
   },
   highlight = {
      enable = true,
      use_languagetree = true,
   },
}

treesitter.setup(options)
