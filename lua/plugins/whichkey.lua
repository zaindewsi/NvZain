local status_ok, wk = pcall(require, "which-key")
if not status_ok then
   return
end

local setup = {
   plugins = {
      marks = false,
      registers = false,
      spelling = { enabled = false, suggestions = 20 },
      presets = {
         operators = false,
         motions = false,
         text_objects = false,
         windows = false,
         nav = false,
         z = false,
         g = false,
      },
   },
}

local mappings = {
   ["e"] = { "<cmd>NvimTreeToggle<cr>", "  Explorer" },
   ["E"] = { ":e ~/.config/nvim/init.lua<cr>", "  Edit config" },
   ["h"] = { "<cmd>nohlsearch<CR>", "  No Highlight" },
   ["x"] = { "<cmd>Bdelete!<CR>", "  Close Buffer" },
}

local opts = {
   mode = "n", -- NORMAL mode
   prefix = "<leader>",
   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
   silent = true, -- use `silent` when creating keymaps
   noremap = true, -- use `noremap` when creating keymaps
   nowait = true, -- use `nowait` when creating keymaps
}

wk.setup(setup)
wk.register(mappings, opts)
