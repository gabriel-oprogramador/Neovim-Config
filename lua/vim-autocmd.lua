vim.cmd([[
    augroup VimStartupSequence
    autocmd!
    " Open NERDTree if (neo)vim is opened wihout file argument
    autocmd VimEnter *
            \   if !argc()
            \ |   NERDTree
            \ |   wincmd w
            \ | endif

    " Automatically install missing plugins
    autocmd VimEnter *
    \   if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \ |   PlugInstall --sync | q
    \ | endif
    augroup END
]])

vim.cmd([[
    augroup RestoreCursorPositionWhenOpeningFile
    autocmd!
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   execute "normal! g`\"" |
          \ endif
  augroup END
]])

function set_relative_numbers()
    vim.wo.relativenumber = true
end
function set_absolute_numbers()
    vim.wo.relativenumber = false
end

vim.cmd([[
    augroup RelativenumberToggle
    autocmd!
    autocmd ModeChanged *:v lua set_relative_numbers()
    autocmd ModeChanged v:* lua set_absolute_numbers()
  augroup END
]])

vim.cmd([[autocmd VimResized * wincmd =]])
