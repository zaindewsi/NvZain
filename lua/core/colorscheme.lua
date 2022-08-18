local present, theme = pcall(require, "catppuccin")

if not present then
   print "color fail"
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
