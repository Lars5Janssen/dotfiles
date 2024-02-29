vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

-- Bindings for Nvim Tree Plugin --
vim.keymap.set('n', '<Space>tj', ':NvimTreeFindFile<CR>')
vim.keymap.set('n', '<Space>tk', ':NvimTreeToggle<CR>')
