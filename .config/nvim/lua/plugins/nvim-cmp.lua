return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			dependencies = "rafamadriz/friendly-snippets",
			opts = { history = true, updateevents = "TextChanged, TextChangedI" },
			config = function(_, opts)
				require("plugins.configs.others").luasnip(opts)
			end,
		},
		{
			"windwp/nvim-autopairs",
			opts = {
				fast_wrap = {},
				disable_filetype = { "TelescopePrompt", "vim" },
			},
			config = function(_, opts)
				require("nvim-autopairs").setup(opts)

				local cmp_autopairs = require("nvim-autopairs.completion.cmp")
				require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
			end,
		},
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		--"hrsh7th/cmp-nvim-lsp-signature-help",
		"chrisgreiser/cmp-nerdfont",
		--"saadparwaiz1/cmp_luasnip",
		--"rafamadriz/friendly-snippets",
		--"onsails/lspkind.nvim",
		--"neovim/nvim-lspconfig",
		"folke/which-key.nvim",
	},
	opts = function()
		return require("plugins.configs.cmp")
	end,
	config = function(_, opts)
		require("cmp").setup(opts)
	end,
	--config = function()
	--	local cmp = require("cmp")
	--	local luasnip = require("luasnip")
	--	local lspkind = require("lspkind")
	--    local wk = require("which-key")
	--	require("luasnip.loaders.from_vscode").lazy_load()
	--    wk.register({
	--        ["<leader>c"] = {
	--            name = "+cmp",
	--            a = { function() vim.lsp.buf.code_action({ apply = true }) end, "Code actions" },
	--        }
	--    })
	--	cmp.setup({
	--		completion = {
	--			completeop = "menu,menuone,previe,noselect",
	--		},
	--		snippet = {
	--			expand = function(args)
	--				luasnip.lsp_expand(args.body)
	--			end,
	--		},
	--		mapping = cmp.mapping.preset.insert({
	--			["<C-n>"] = cmp.mapping.select_prev_item(),
	--			["<C-p>"] = cmp.mapping.select_next_item(),
	--			["<CR>"] = cmp.mapping.confirm({ select = false }),
	--			["<Tab>"] = cmp.mapping.confirm({ select = true }),
	--			["<C-g>"] = cmp.mapping.complete(),
	--			["<C-u>"] = cmp.mapping.scroll_docs(-4),
	--			["<C-d>"] = cmp.mapping.scroll_docs(4),
	--			["<C-e>"] = cmp.mapping.abort(),
	--		}),
	--		sources = cmp.config.sources({
	--			{ name = "nvim_lsp" },
	--			{ name = "cmp-nvim-lsp-signature-help" },
	--			{ name = "luasnip", keyword_length = 2 },
	--			--{ name = "buffer", keyword_length = 8 },
	--			{ name = "path" },
	--			--{ name = "nerdfont" },
	--		}),
	--		formatting = {
	--			format = lspkind.cmp_format({
	--				maxwidth = 50,
	--				ellipsis_char = "...",
	--			}),
	--		},
	--	})
	--end,
}
