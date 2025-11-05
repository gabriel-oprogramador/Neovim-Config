require('mason').setup({})
local lsp = vim.lsp

local orig_open_floating_preview = lsp.util.open_floating_preview
vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or "rounded"
    opts.focusable = true --opts.focusable or false
    opts.max_width = opts.max_width or 80
    opts.max_height = opts.max_height or 6
    -- Chama a função original com essas opções
    return orig_open_floating_preview(contents, syntax, opts, ...)
end

local capabilities = lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    SetupDiagnostic()
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, opts)
    vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '<space>w', vim.diagnostic.goto_prev)
    vim.keymap.set('n', '<space>s', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<space>l', vim.diagnostic.setloclist)
    vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
    end, opts)
end

local lspkind = require('lspkind')
local cmp = require('cmp')
cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 42,
            ellipsis_char = '…',
            show_labelDetails = true,
            before = function(entry, vim_item)
                vim_item.menu = nil
                vim_item.abbr = vim_item.abbr
                return vim_item
            end
        })
    },
    snippet = {
        expand = function(args)
            require 'snippy'.expand_snippet(args.body)
        end,
    },
    mapping = {
        ['<C-q>'] = cmp.mapping.select_prev_item(),
        ['<C-e>'] = cmp.mapping.select_next_item(),
        ['<Up>'] = cmp.mapping.select_prev_item(),
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-f>'] = cmp.mapping.complete(),
        ['<Esc>'] = cmp.mapping.abort(),
    },
    -- Priorizando as fontes
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },    -- autocomplete do projeto, LSP primeiro
        { name = 'nvim-snippy' }, -- snippets
        { name = 'buffer' },      -- fallback para palavras do buffer
        { name = 'path' },        -- caminhos de arquivos
        { name = 'calc' },        -- calculadora
        { name = 'nvim_lua' },    -- API do Neovim
    }),

    sorting = {
        priority_weight = 2,
        comparators = {
            cmp.config.compare.locality,     -- 🧠 prioriza símbolos perto no código (muito útil)
            cmp.config.compare.exact,        -- ✅ match exato vem primeiro
            cmp.config.compare.score,        -- 📊 mantém relevância do LSP (sem pesar muito)
            cmp.config.compare.offset,       -- 🔍 posição dentro da linha
            cmp.config.compare.kind,         -- 🧩 separa função/variável/tipo
            cmp.config.compare.length,       -- 🔠 palavras menores antes
            cmp.config.compare.order,        -- 🔚 fallback padrão
        },
    }

})

-- Integração nvim-autopairs com nvim-cmp
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
-- Configuração básica do autopairs
require('nvim-autopairs').setup({
    check_ts = true, -- usa Treesitter para evitar pares errados (ex: dentro de comentários)
    fast_wrap = {},  -- habilita wrap rápido com tecla
})

function SetupDiagnostic()
    vim.diagnostic.config({
        virtual_text = true,     -- mostra os erros na linha
        signs = true,            -- mostra ícones na gutter
        update_in_insert = true, -- atualiza durante inserção
        underline = true,
        severity_sort = true,
    })
end

SetupDiagnostic()

local function setupServer(name)
    lsp.config[name] = {
        on_attach = on_attach,
        capabilities = capabilities,
    }
    lsp.enable(name)
end

lsp.config('clangd', {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "clangd", "-header-insertion=never" },
    root_markers = { "compile_commands.json", "Makefile", ".git" },
})
lsp.enable('clangd')
vim.fn.getcwd()

lsp.config('jdtls', {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
        "jdtls",
        "-vmargs", "-Xms4g", "-Xmx4g", "-XX:+UseG1GC",
        "-XX:+UseStringDeduplication", "-XX:+HeapDumpOnOutOfMemoryError"
    },
    root_markers = { '.project', 'build.gradle', 'build.gradle.kts', 'build.xml', 'pom.xml', 'settings.gradle', 'settings.gradle.kts', '.git' },
})
lsp.enable('jdtls')

setupServer('omnisharp')
setupServer('html')
setupServer('cssls')
setupServer('lua_ls')
setupServer('ts_ls')
setupServer('zls')
setupServer('gopls')
setupServer('glsl_analyzer')
setupServer('rust_analyzer')
setupServer('jsonls')
setupServer('svelte')
setupServer('pyright')
