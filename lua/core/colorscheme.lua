local present, theme = pcall(require, "catppuccin")

if not present then
   return
end

local iterm_profile = os.getenv "ITERM_PROFILE"
local style = "macchiato"
if iterm_profile == "light" then
   style = "latte"
else
   style = "macchiato"
end

local setup = {
   transparent_background = true,
   term_colors = false,
   styles = {
      comments = "italic",
      conditionals = "italic",
      loops = "NONE",
      functions = "NONE",
      keywords = "NONE",
      strings = "NONE",
      variables = "NONE",
      numbers = "NONE",
      booleans = "NONE",
      properties = "NONE",
      types = "NONE",
      operators = "NONE",
   },
   integrations = {
      treesitter = true,
      native_lsp = {
         enabled = true,
         virtual_text = {
            errors = "italic",
            hints = "italic",
            warnings = "italic",
            information = "italic",
         },
         underlines = {
            errors = "underline",
            hints = "underline",
            warnings = "underline",
            information = "underline",
         },
      },
      lsp_trouble = false,
      cmp = true,
      lsp_saga = false,
      gitgutter = false,
      gitsigns = true,
      telescope = true,
      nvimtree = {
         enabled = true,
         show_root = false,
         transparent_panel = true,
      },
      neotree = {
         enabled = false,
         show_root = false,
         transparent_panel = false,
      },
      which_key = false,
      indent_blankline = {
         enabled = true,
         colored_indent_levels = false,
      },
      dashboard = true,
      neogit = false,
      vim_sneak = false,
      fern = false,
      barbar = false,
      bufferline = true,
      markdown = true,
      lightspeed = false,
      ts_rainbow = false,
      hop = false,
      notify = true,
      telekasten = true,
      symbols_outline = true,
   },
}

theme.setup(setup)

vim.g.catppuccin_flavour = style

vim.cmd [[
try
  colorscheme catppuccin
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
