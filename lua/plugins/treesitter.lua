vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
   underline = true,
   virtual_text = {
      spacing = 5,
      severity_limit = "Warning",
   },
   update_in_insert = true,
})

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
}

treesitter.setup(options)
