local Set = vim.api.nvim_set_keymap
local Noremap = { noremap = true, silent = true }

require("vim-plug")
require("vim-plugins")
require("vim-settings")
require("vim-autocmd")
require("vim-keymaps")
vim.cmd("colorscheme gruvbox")

-- Map Leader
vim.g.mapleader = '.'

-- Rename in File => space + rn
-- Find File => space + ff
-- Find Buffer => space + fb
-- Formater => space + f
-- Autocomplete => Ctrl + f
-- Show Line Error space + e
-- List Errors => space + l
-- Prev Error => space + w
-- Next Error => space = s
-- Swap Splits Horizontally => Ctrl + r
-- Comment => leader + cc |_(*-*)_|
-- Uncomment => leader + cu \_(-_0)_/

-- For some LSPs on Windows you need to allow Powershell to execute commands. Example(tsserver)
-- Enable Commands  "Set-ExecutionPolicy Unrestricted"
-- Disable Commands "Set-ExecutionPolicy Restricted"

-- Web Development
-- npm install -g http-server
-- http-server
-- npm install -g browser-sync
-- browser-sync start --server --files "*.html, *.css, *.js"

-- Transparency -------------------------------

-- Comment to disable Transparency by default
 vim.cmd [[
   hi Normal guibg=NONE ctermbg=NONE
   hi LineNr guibg=NONE ctermbg=NONE
   hi SignColumn guibg=NONE ctermbg=NONE
   hi EndOfBuffer guibg=NONE ctermbg=NONE
 ]]

function EnableTransparency()
  vim.cmd [[
    hi Normal guibg=NONE ctermbg=NONE
    hi LineNr guibg=NONE ctermbg=NONE
    hi SignColumn guibg=NONE ctermbg=NONE
    hi EndOfBuffer guibg=NONE ctermbg=NONE
  ]]
  print("Transparency On")
end

-- #202020 or #282828
function DisableTransparency()
  vim.cmd [[
    hi Normal guibg=#181818 ctermbg=NONE
    hi LineNr guibg=#181818 ctermbg=NONE
    hi SignColumn guibg=#232323 ctermbg=NONE
    hi EndOfBuffer guibg=#181818 ctermbg=NONE
  ]]
  print("Transparency Off")
end

-- Command to disable transparency
vim.api.nvim_create_user_command('EnableTransparency', EnableTransparency, {})

-- Command to disable transparency
vim.api.nvim_create_user_command('DisableTransparency', DisableTransparency, {})

function OpenDebuguer()
  vim.fn.system('code .')
end

-- For C or C++
-- Install the Visual Studio Code "Makefile Tools" extension
-- Use this Clang to debug in GDB format! @Obs: Only if you are on Windows.
-- https://github.com/mstorsjo/llvm-mingw/releases
-- I recommend using the W64devkit which contains GCC, G++ GDB, Make, mkdir, rmdir and more for Windows. Obs: Only if you are on Windows.
-- https://github.com/skeeto/w64devkit
Set("n", "<F5>", ":Debugger<CR>", Noremap)
vim.api.nvim_create_user_command('Debugger', OpenDebuguer, {})


