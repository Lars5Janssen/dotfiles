vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Bindings for Nvim Tree Plugin --
vim.keymap.set('n', '<Space>tj', ':NvimTreeFindFile<CR>')
vim.keymap.set('n', '<Space>tk', ':NvimTreeToggle<CR>')

-- Bindings for Telescope Plugin --
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<Space><Space>', builtin.live_grep, {})
vim.keymap.set('n', '<Space>fg', builtin.buffers, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})

-- For LSP Bindings look in lsp_config.lua --
