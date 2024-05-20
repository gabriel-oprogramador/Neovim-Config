local g = vim.g
local Set = vim.api.nvim_set_keymap
local Noremap = { noremap = true, silent = true }

vim.keymap.set("v", "<space>y", "\"+y")
vim.keymap.set("x", "<S-left>p", "\"-dP")
vim.keymap.set("n", "JJ", "mzJ'z")

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
Set("n", "<C-r>", "<C-w>r", Noremap)

-- Telescope
if 'nvim' then
    Set('n', '<space>ff', ":Telescope find_files<CR>", Noremap)
    Set('n', '<space>fg', ":Telescope live_grep<CR>", Noremap)
    Set('n', '<space>fb', ":Telescope buffers<CR>", Noremap)
    Set('n', '<space>fh', ":Telescope help_tags<CR>", Noremap)
end

-- Floaterm
g.floaterm_width = 120
if vim.loop.os_uname().sysname == "Windows_NT" then
	if vim.fn.executable('Pwsh') == 1 then
  		g.floaterm_shell = 'Pwsh'
	else
		g.floaterm_shell = 'Powershell'
	end
end

vim.cmd [[
	" Configuration example
	hi Floaterm guibg=NONE
	hi FloatermBorder guibg=#303030 guifg=white
]]

g.floaterm_keymap_new = '<space>ft'
g.floaterm_keymap_prev = '<space>fp'
g.floaterm_keymap_next = '<space>fn'
g.floaterm_keymap_kill = '<space>fk'
g.floaterm_keymap_hide = '<esc>'
g.floaterm_keymap_toggle = '<C-t>'
g.floaterm_wintype = 'float'
g.floaterm_titleposition = 'center'
g.floaterm_positio = 'right' -- Need wintype = 'split'/'vsplit'

-- Add " in Word / Line
Set('n', '<space>w"', 'viw<ESC>a"<esc>bi"<esc>', Noremap)
Set("n", "<space>w'", "viw<ESC>a'<esc>bi'<esc>", Noremap)

-- Add ' in Word / Line
Set('n', '<space>l"', 'V<ESC>A"<esc>I"<esc>', Noremap)
Set("n", "<space>l'", "V<ESC>A'<esc>I'<esc>", Noremap)
Set('n', '<space>ll"', 'N<ESC>$x<esc>^x<esc>', Noremap)
Set("n", "<space>ll'", "N<ESC>$x<esc>^x<esc>", Noremap)

-- Nerd Commenter Toggle
vim.api.nvim_set_keymap('n', '<space>c', '<Plug>NERDCommenterToggle', {})
vim.api.nvim_set_keymap('v', '<space>c', '<Plug>NERDCommenterToggle<CR>', {})

-- LSP Diagnostic
Set('n', '<Esc>', ":lclose<CR>", Noremap)
