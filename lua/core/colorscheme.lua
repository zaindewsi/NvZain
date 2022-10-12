local iterm_profile = os.getenv "ITERM_PROFILE"
local theme = "moon"
if iterm_profile == "light" then
   theme = "day"
else
   theme = "moon"
end

require("tokyonight").setup {
   style = theme,
   transparent = true,
   day_brightness = 0.4,
}

vim.cmd [[
try
  colorscheme tokyonight
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
