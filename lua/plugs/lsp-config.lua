local lsp = require("lspconfig")
local cmp = require('cmp')
local capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, opts)
  vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<space>f', function()
    vim.lsp.buf.format { async = true }
  end, opts)
end

cmp.setup({
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
  sources = {
    { name = 'nvim-snippy' },
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'calc' },
    { name = 'nvim_lua' },
  },
})

-- To use these LPS Use the "LspInstall name" command to install the server.

lsp.clangd.setup({
  cmd = {"clangd", "-header-insertion=never"},
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lsp.util.root_pattern({"Makefile", ".git", "compile_commands.json"}),
})

lsp.glsl_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

lsp.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

lsp.omnisharp.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

lsp.jdtls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp.html.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

lsp.cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

lsp.ts_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

lsp.svelte.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

lsp.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<space>w', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<space>s', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>l', vim.diagnostic.setloclist)


