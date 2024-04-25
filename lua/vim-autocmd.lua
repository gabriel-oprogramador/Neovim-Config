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
