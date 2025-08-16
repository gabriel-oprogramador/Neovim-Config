local g = vim.g

-- fold
vim.o.foldmethod = "indent"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = true
vim.o.foldlevel = 99

require('nvim-web-devicons').setup {
  color_icons = true,
  default = true
}

-- Configuração Airline
vim.g.airline_theme = "distinguished"
vim.g.airline_extensions_tabline_enabled = 1 -- 120
vim.g.airline_powerline_fonts = 1
vim.g.airline_skip_empty_sections = 1

vim.g.webdevicons_enable = 1
vim.g.WebDevIconsUnicodeDecorateFolderNodes = 1
vim.g.WebDevIconsUnicodeDecorateFileNodes = 1

-- Telescope
require('telescope').setup {
    defaults = {
      file_ignore_patterns = {
        "%.git",
        "%.cache",
        "%.png",
        "%.jpg",
        "%.jpeg",
        "%.o",
        ".cache",
        "Build"
        },
    },
}

-- Floaterm
g.floaterm_width = 120
if vim.loop.os_uname().sysname == "Windows_NT" then
    if vim.fn.executable('Pwsh') == 1 then
        g.floaterm_shell = 'Pwsh'
    else
        g.floaterm_shell = 'Powershell'
    end
end

g.floaterm_keymap_new = '<space>ft'
g.floaterm_keymap_prev = '<space>fp'
g.floaterm_keymap_next = '<space>fn'
g.floaterm_keymap_kill = '<space>fk'
g.floaterm_keymap_toggle = '<C-t>'
g.floaterm_wintype = 'float'
g.floaterm_titleposition = 'center'
g.floaterm_positio = 'right' -- Need wintype = 'split'/'vsplit'

-- Configuração do Treesitter
require 'nvim-treesitter.configs'.setup {
    -- Linguagens que quer instalar
    ensure_installed = {},
    sync_install = false, -- instala parsers em paralelo
    auto_install = true,  -- instala automaticamente quando abrir arquivos de linguagens suportadas

    highlight = {
        enable = false,                             -- destaca código com Treesitter
        additional_vim_regex_highlighting = false, -- evita highlight duplo
    },
}

-- Ativar o plugin nvim-ts-autotag
require('nvim-ts-autotag').setup()
require("nvim-autopairs").setup({})
