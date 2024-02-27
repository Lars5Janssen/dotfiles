local configs = require('nvim-treesitter.configs')
configs.setup({
  ensure_installed = { "c", "java", "lua", "rust", "ruby", "vim"},

  sync_install = false,
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})
