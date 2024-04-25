local Set = vim.api.nvim_set_keymap
local Noremap = { noremap = true, silent = true }

require("vim-plug")
require("vim-plugins")
require("vim-settings")
require("vim-autocmd")
require("vim-keymaps")
vim.cmd("colorscheme gruvbox")

-- Game Development
-- Clean Makefile
Set("n", "<F12>", ":!make rebuild<CR>", Noremap)
-- Debug MakeFile
Set("n", "<F6>", ":!make clean<CR> :!code . <CR>", Noremap)
-- Run MakeFile
Set("n", "<F5>", ":!make run<CR>", Noremap)

-- Web Development
-- npm install -g http-server
-- http-server
-- npm install -g browser-sync
-- browser-sync start --server --files "*.html, *.css, *.js"
