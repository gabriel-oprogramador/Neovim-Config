local Set = vim.api.nvim_set_keymap
local Noremap = { noremap = true, silent = true }

require("vim-plug")
require("vim-plugins")
require("vim-settings")
require("vim-autocmd")
require("vim-keymaps")
vim.cmd("colorscheme gruvbox")

-- Autocomplete => Ctrl + f
-- Show line Error space + e
-- List Errors => space + l

vim.cmd("command! Debugger :!code . <CR>")
Set("n", "<F12>", ":Debugger<CR>", Noremap)

-- Web Development
-- npm install -g http-server
-- http-server
-- npm install -g browser-sync
-- browser-sync start --server --files "*.html, *.css, *.js"

