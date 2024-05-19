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
-- Find File => space + ff
-- Find Buffer => space + fb
-- Formater => space + f
-- Autocomplete => Ctrl + f
-- Show Line Error space + e
-- List Errors => space + l
-- Prev Error => space + w
-- Next Error => space = s
-- Swap Splits Horizontally => Ctrl + r
-- Comment => leader + cc
-- Uncomment => leader + cu \_(-_0)_/

-- For some LSPs on Windows you need to allow Powershell to execute commands. Example(tsserver)
-- Enable Commands  "Set-ExecutionPolicy Unrestricted"
-- Disable Commands "Set-ExecutionPolicy Restricted"

vim.cmd("command! Debugger :!code . <CR>")
Set("n", "<F12>", ":Debugger<CR>", Noremap)

-- Web Development
-- npm install -g http-server
-- http-server
-- npm install -g browser-sync
-- browser-sync start --server --files "*.html, *.css, *.js"

-- Transparency -------------------------------

-- Uncomment for Transfer by default
---> vim.cmd [[
--->   hi Normal guibg=NONE ctermbg=NONE
--->   hi LineNr guibg=NONE ctermbg=NONE
--->   hi SignColumn guibg=NONE ctermbg=NONE
--->   hi EndOfBuffer guibg=NONE ctermbg=NONE
---> ]]

function EnableTransparency()
  vim.cmd [[
    hi Normal guibg=NONE ctermbg=NONE
    hi LineNr guibg=NONE ctermbg=NONE
    hi SignColumn guibg=NONE ctermbg=NONE
    hi EndOfBuffer guibg=NONE ctermbg=NONE
  ]]
  print("Transparência ativada")
end

-- #202020 or #282828
function DisableTransparency()
  vim.cmd [[
    hi Normal guibg=#202020 ctermbg=NONE  " Ajuste para a cor de fundo desejada do Gruvbox
    hi LineNr guibg=#202020 ctermbg=NONE
    hi SignColumn guibg=#303030 ctermbg=NONE
    hi EndOfBuffer guibg=#202020 ctermbg=NONE
  ]]
  print("Transparência desativada")
end

-- Command to disable transparency
vim.api.nvim_create_user_command('EnableTransparency', EnableTransparency, {})

-- Comando para desativar a transparência
vim.api.nvim_create_user_command('DisableTransparency', DisableTransparency, {})
