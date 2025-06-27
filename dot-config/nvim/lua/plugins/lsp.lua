return {
        'neovim/nvim-lspconfig',
        dependencies = {
            "folke/which-key.nvim",
            "williamboman/mason.nvim",
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
        },
        config = function()
            local ensure_installed = {
                    'vtsls',
                    'html',
                    "lua_ls",
                    "gopls",
                }
            local cmp = require('cmp')
            local luasnip = require('luasnip')
            cmp.setup({
                sources = {
                { name = 'nvim_lsp' },
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
            })
            local lspconfig = require('lspconfig')
            local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
            require("mason").setup({})
            require('mason-lspconfig').setup({
                ensure_installed = ensure_installed,
                handlers = {
                    function(server)
                        lspconfig[server].setup({
                            capabilities = lsp_capabilities,
                            })
                    end,
                },
            })

        end,
}
