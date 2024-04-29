local g = vim.g
local Set = vim.api.nvim_set_keymap
local Noremap = { noremap = true, silent = true }

-- Map Leader
g.mapleader = ' '

-- Nerd Tree
Set("n", "<C-n>", ":NERDTreeToggle<CR>", Noremap)

-- Create Lines
Set("n", "op", "o<Esc>k<CR>", Noremap)
Set("n", "oi", "O<Esc>j", Noremap)
Set("n", "oo", "A<CR>", Noremap)

-- Navegate Splites
Set("n", "<C-h>", "<C-w>h", Noremap)
Set("n", "<C-j>", "<C-w>j", Noremap)
Set("n", "<C-k>", "<C-w>k", Noremap)
Set("n", "<C-l>", "<C-w>l", Noremap)

-- Telescope
if 'nvim' then
    Set('n', '<Leader>ff', ":Telescope find_files<CR>", Noremap)
    Set('n', '<Leader>fg', ":Telescope live_grep<CR>", Noremap)
    Set('n', '<Leader>fb', ":Telescope buffers<CR>", Noremap)
    Set('n', '<Leader>fh', ":Telescope help_tags<CR>", Noremap)
end

-- Floaterm
g.floaterm_wintype = 'vsplit'
g.floaterm_width = 120
if vim.loop.os_uname().sysname == "Windows_NT" then
  g.floaterm_shell = 'powershell'
end

Set("n", "<C-t>", ":FloatermNew<CR>", Noremap)
Set("t", "<Esc>", '<C-\\><C-n>:q<CR>', Noremap)

-- LSP Diagnostic
Set('n', '<Esc>', ":lclose<CR>", Noremap)
