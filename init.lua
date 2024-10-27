-- Neovim-Config @gabriel_oprogramador
-- Version 17.00

local Set = vim.api.nvim_set_keymap
local Noremap = { noremap = true, silent = true }

require("vim-plug")
require("vim-plugins")
require("vim-settings")
require("vim-autocmd")
require("vim-keymaps")
vim.cmd("colorscheme gruvbox")

-- On Windows I recommend using PowerShell 7 and Windows Terminal!
-- To use these LPS Use the "LspInstall name" command to install the server.

-- Transparency -------------------------------
-- Uncomment the desired option.
--vim.cmd [[autocmd VimEnter * lua EnableTransparency()]]
vim.cmd [[autocmd VimEnter * lua DisableTransparency()]]

--Command to activate and deactivate transparency.
---> :EnableTransparency
---> :DisableTransparency

-- Map Leader
vim.g.mapleader = '.'
-- Jump To Backward => space + o
-- Jump To Forward => space + p
-- Rename in File => space + rn
-- Find File => space + ff
-- Find Buffer => space + fb
-- Formater => space + f
-- Autocomplete => Ctrl + f
-- Comment Toggle => space + c 
-- Show Line Error space + e
-- List Errors => space + l
-- Prev Error => space + w
-- Next Error => space = s
-- Swap Splits Horizontally => tab @Note in normal mode
-- Terminal Toggle => Ctrl + t @Note If you don't already have one, create a new one.
-- Terminal New => space + ft
-- Terminal Prev => space + fp
-- Terminal Next => space + fn
-- Terminal Kill => space + fk
-- Terminal Hide => esc
-- Involve the word in ' => space + w + '
-- Involve the word in " => space + w + "
-- Wrap the line in ' => space + l + '
-- Wrap the line in " => space + l + "
-- Remove the ' from the line => space + ll + '
-- Remove the " from the line => space + ll + "

-- NOTE --
-- For some LSPs on Windows you need to allow Powershell to execute commands. Example(tsserver)
-- Enable Commands  "Set-ExecutionPolicy Unrestricted"
-- Disable Commands "Set-ExecutionPolicy Restricted"

-- Web Development
-- npm install -g http-server
-- http-server
-- npm install -g browser-sync
-- browser-sync start --server --files "*.html, *.css, *.js"

function OpenDebugger()
  vim.fn.system('code .')
end

-- For C or C++
-- Install the Visual Studio Code "Makefile Tools" extension
-- Use this Clang to debug in GDB format! @Note: Only if you are on Windows.
-- https://github.com/mstorsjo/llvm-mingw/releases
-- I recommend using the W64devkit which contains GCC, G++ GDB, Make, mkdir, rmdir and more for Windows. @Note: Only if you are on Windows.
-- https://github.com/skeeto/w64devkit
Set("n", "<F5>", ":Debugger<CR>", Noremap)
vim.api.nvim_create_user_command('Debugger', OpenDebugger, {})


