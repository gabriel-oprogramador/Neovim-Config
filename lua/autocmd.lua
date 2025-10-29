vim.cmd([[
function! AirlineClock()
  return strftime("%H:%M")
endfunction

let g:airline_section_z = airline#section#create_right(['%l/%L:%c, %p%%', '%{AirlineClock()}'])
]])

if vim.fn.has('timers') == 1 then
  vim.fn.timer_start(1000, function()
    vim.cmd('redrawstatus')
  end, { ['repeat'] = -1 })
end


vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local clients = vim.lsp.get_clients({ bufnr = bufnr })
        local can_format = false

        for _, client in ipairs(clients) do
            if client.supports_method("textDocument/formatting") then
                can_format = true
                break
            end
        end

        if can_format then
            vim.lsp.buf.format({ async = true })
        end
    end,
})

vim.cmd [[
	" Configuration example
	hi Floaterm guibg=NONE
	hi FloatermBorder guibg=#303030 guifg=white
]]

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

vim.cmd [[
    augroup DisableAutomaticComment
    autocmd!
    autocmd FileType * setlocal formatoptions -=c formatoptions -=r formatoptions -=0
]]

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
