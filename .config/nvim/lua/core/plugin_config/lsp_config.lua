local servers = { "lua_ls", "marksman", "bashls", "jdtls", "jedi_language_server", "dockerls", "docker_compose_language_service" }

require("mason").setup()
require'lspconfig'.lua_ls.setup{}
require("mason-lspconfig").setup({
  ensure_installed = servers,
})

local on_attach = function(_, _)
  local opts = { buffer = ev.buf }
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.renamem, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
end

local lspconfig = require('lspconfig')

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
  }
end
