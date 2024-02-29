local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    'nvim-lua/plenary.nvim',
    { 'catppuccin/nvim', name = "catppuccin", priority = 1000 },
    'nvim-tree/nvim-tree.lua',
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
	'nvim-tree/nvim-web-devicons',
    'ThePrimeagen/harpoon',
    'nvim-lualine/lualine.nvim',
    {{
        'nvim-treesitter/nvim-treesitter', tag = 'v.8.5.2', build = ':TSUpdate'},
        'nvim-treesitter/playground',
    },
    'RRethy/vim-illuminate',
    'norcalli/nvim-colorizer.lua',
    {'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' }},
    'mfussenegger/nvim-lint',
    {
        'mfussenegger/nvim-jdtls', -- TODO update jdtls to newer snapshot
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
    },
    'mbbill/undotree',
    {
        'hrsh7th/nvim-cmp',
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'chrisgrieser/cmp-nerdfont',
        'rafamadriz/friendly-snippets',
    },
    'lewis6991/gitsigns.nvim',
    'tpope/vim-fugitive',

})
