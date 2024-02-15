vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>') -- Requires Plugin Nvim Tree
