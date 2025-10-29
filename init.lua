
require('settings')
require('keymaping')

require('vimplug')
require('configs')
require('lsp')
require('theme')
require('autocmd')

vim.cmd("colorscheme gruvbox")
-- Transparency -------------------------------
-- Uncomment the desired option.
--vim.cmd [[autocmd VimEnter * lua EnableTransparency()]]
vim.cmd [[autocmd VimEnter * lua DisableTransparency()]]

--Command to activate and deactivate transparency.
---> :EnableTransparency
---> :DisableTransparency

-- Map Leader
vim.g.mapleader = '.'
-- fold scope => space + tab
-- Jump To Backward => Ctrl + o
-- Jump To Forward =>  ctrl + p
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

-- :MasonInstall clangd                     -- C / C++
-- :MasonInstall jdtls                      -- Java
-- :MasonInstall omnisharp                  -- C# / .cs
-- :MasonInstall html                       -- HTML / .html
-- :MasonInstall cssls                      -- CSS / .css
-- :MasonInstall lua_ls                     -- Lua / .lua
-- :MasonInstall typescript-language-server -- Type/JavaScript / .ts/js, .tsx/jsx
-- :MasonInstall zls                        -- Zig / .zig
-- :MasonInstall gopls                      -- Go / .go
-- :MasonInstall glsl_analyzer              -- GLSL / .vert, .frag
-- :MasonInstall rust_analyzer              -- Rust / .rs
-- :MasonInstall jsonls                     -- JSON / .json
-- :MasonInstall svelte                     -- Svelte / .svelte
-- :MasonInstall pyright                    -- Python / .py