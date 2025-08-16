require('mason').setup({})
local lsp = vim.lsp

-- Configuração básica do autopairs
require('nvim-autopairs').setup({
    check_ts = true, -- usa Treesitter para evitar pares errados (ex: dentro de comentários)
    fast_wrap = {},  -- habilita wrap rápido com tecla
})

local cmp = require('cmp')
cmp.setup({
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
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    },
})

-- Integração nvim-autopairs com nvim-cmp
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

function SetupDiagnostic()
    vim.diagnostic.config({
        virtual_text = true,      -- mostra os erros na linha
        signs = true,             -- mostra ícones na gutter
        update_in_insert = false, -- não atualiza durante inserção
        underline = true,
        severity_sort = true,
        float = { border = "rounded" },
    })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
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

local rootDir = vim.fn.getcwd()
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
    cmd = { "clangd", "-header-insertion=never", "--background-index", "--clang-tidy" },
    root_markers = { "compile_commands.json", "Makefile", ".git" },
})
lsp.enable('clangd')

local javaCache = rootDir .. '/.vscode'
local javaConfig = javaCache .. "/config"
local javaWorkspace = javaCache .. "/workspace"
lsp.config('jdtls', {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
        "jdtls", "-configuration", javaConfig, "-data", javaWorkspace,
        "-vmargs", "-Xms4g", "-Xmx4g", "-XX:+UseG1GC",
        "-XX:+UseStringDeduplication", "-XX:+HeapDumpOnOutOfMemoryError"
    },
    root_markers = { '.git', 'Makefile', 'compile_commands.json', 'build.gradle', 'build.gradle.kts', 'build.xml', 'pom.xml', 'settings.gradle', 'settings.gradle.kts' },
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
