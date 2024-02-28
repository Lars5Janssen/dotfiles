local lazypath = vim.fn.stdpath('data') .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
    'nvim-lua/plenary.nvim',
    { 'catppuccin/nvim', name = "catppuccin", priority = 1000 },
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',
    'ThePrimeagen/harpoon',
    'nvim-lualine/lualine.nvim',
    {'nvim-treesitter/nvim-treesitter',
        tag = 'v0.8.5.2',
        build = ':TSUpdate',},
    'nvim-treesitter/playground',
    'RRethy/vim-illuminate',
    'norcalli/nvim-colorizer.lua',
    {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
    },
    'lewis6991/gitsigns.nvim',
    'tpope/vim-fugitive',
    --'folke/which-key.nvim',
    --'nvimdev/dashboard-nvim',
})
