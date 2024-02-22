vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Bindings for Nvim Tree Plugin --
vim.keymap.set('n', '<Space>tj', ':NvimTreeFindFile<CR>')
vim.keymap.set('n', '<Space>tk', ':NvimTreeToggle<CR>')
