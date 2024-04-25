local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
--Plugs
Plug 'ellisonleao/gruvbox.nvim'
Plug 'voldikss/vim-floaterm'
Plug 'windwp/nvim-autopairs'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'pboettch/vim-highlight-cursor-words'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
--LSP
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
--CMP
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'dcampos/nvim-snippy'
Plug 'dcampos/cmp-snippy'
vim.call'plug#end'

--require("nvim-autopairs").setup({})
--require("auto-pairs").setup({})
