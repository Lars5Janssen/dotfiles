local servers = { "lua_ls", "marksman", "bashls", "jdtls", "jedi_language_server", "dockerls", "docker_compose_language_service" }

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = servers,
})

local on_attach = function(_, bufnr)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.renamem, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local lspconfig = require('lspconfig')

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
  }
end
