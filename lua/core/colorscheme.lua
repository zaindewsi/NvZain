local iterm_profile = os.getenv "ITERM_PROFILE"
local style = "storm"
if iterm_profile == "light" then
   style = "day"
else
   style = "storm"
end

vim.g.tokyonight_style = style
vim.g.tokyonight_transparent = true
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_day_brightness = 0.2

vim.cmd [[
try
  colorscheme tokyonight
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
