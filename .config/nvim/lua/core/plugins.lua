local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- Theme
  use {'catppuccin/nvim', as = 'catppuccin'}

  -- Nvim Tree: File Browser
  use {
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',
  }

  -- lualine: ???
  use 'nvim-lualine/lualine.nvim'

  -- Treesitter: ???
  use 'nvim-treesitter/nvim-treesitter'

  -- Colorizer: Displays real colors for colorcodes
  use 'norcalli/nvim-colorizer.lua'

  -- Telescope: ???
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Linting
  use 'mfussenegger/nvim-lint'

  -- LSP
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }

  -- Snippets
  use {
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    'L3MON4D3/LuaSnip',
  }
  -- Snippet Sources
  use {
    'hrsh7th/cmp-nvim-lsp',       -- LSP source for nvim-cmp
    'saadparwaiz1/cmp_luasnip',   -- Snippets source for nvim-cmp
    'chrisgrieser/cmp-nerdfont',  -- Source for nerdfonts
    'hrsh7th/cmp-nvim-lua',       -- Source for Nvim Lua API
    'hrsh7th/cmp-path',           -- Sources for paths
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
