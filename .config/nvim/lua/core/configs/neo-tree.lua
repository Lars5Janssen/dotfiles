vim.keymap.set('n', '<leader>tj', ':Neotree<CR>')
vim.keymap.set('n', '<leader>tk', ':Neotree<CR>q')
require('neo-tree').setup({
    mappings = {
        ["L"] = "open",
    },
})
