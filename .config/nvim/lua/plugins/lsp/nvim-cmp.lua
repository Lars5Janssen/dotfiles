return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"L3MON4D3/LuaSnip",
		"chrisgreiser/cmp-nerdfont",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
		"neovim/nvim-lspconfig",
        "folke/which-key.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
        local wk = require("which-key")
		require("luasnip.loaders.from_vscode").lazy_load()
        wk.register({
            ["<leader>c"] = {
                name = "+cmp",
                a = { function() vim.lsp.buf.code_action({ apply = true }) end, "Code actions" },
            }
        })
		cmp.setup({
			completion = {
				completeop = "menu,menuone,previe,noselect",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_prev_item(),
				["<C-p>"] = cmp.mapping.select_next_item(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<Tab>"] = cmp.mapping.confirm({ select = true }),
				["<C-g>"] = cmp.mapping.complete(),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.abort(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "cmp-nvim-lsp-signature-help" },
				{ name = "luasnip", keyword_length = 2 },
				--{ name = "buffer", keyword_length = 8 },
				{ name = "path" },
				--{ name = "nerdfont" },
			}),
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})
	end,
}
