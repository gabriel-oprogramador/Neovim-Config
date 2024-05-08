local Set = vim.api.nvim_set_keymap
local Noremap = { noremap = true, silent = true }

require("vim-plug")
require("vim-plugins")
require("vim-settings")
require("vim-autocmd")
require("vim-keymaps")
vim.cmd("colorscheme gruvbox")

-- Leader => .
-- Rename in File => space + rn
-- Find File => Leader + ff
-- Formater => space + f
-- Autocomplete => Ctrl + Space
-- Show line Error space + s
-- List Errors => space + l
-- Prev error => space + q
-- Next error => space = e
-- Comment => leader + cc
-- Uncomment => leader + cu \_(-_0)_/

vim.cmd("command! Debugger :!code . <CR>")
Set("n", "<F12>", ":Debugger<CR>", Noremap)

-- Web Development
-- npm install -g http-server
-- http-server
-- npm install -g browser-sync
-- browser-sync start --server --files "*.html, *.css, *.js"

