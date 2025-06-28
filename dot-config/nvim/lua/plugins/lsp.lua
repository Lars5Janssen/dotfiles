return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"folke/which-key.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
	},
	config = function()
		local wk = require("which-key")
		local ensure_installed = {
			"vtsls",
			"html",
			"lua_ls",
			"gopls",
		}
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		cmp.setup({
			sources = {
				{ name = "nvim_lsp" },
			},
			mapping = {
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				}),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif require("luasnip").expand_or_jumpable() then
						vim.fn.feedkeys(
							vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
							""
						)
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif require("luasnip").jumpable(-1) then
						vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
			},

			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
		})

		wk.add({
			{ mode = "n" },
			{
				"<leader>a",
				function()
					vim.lsp.buf.code_action()
				end,
				desc = "Code actions",
				silent = true,
				buffer = vim.api.nvim_get_current_buf(),
			},
		})

		local lspconfig = require("lspconfig")
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
		require("mason").setup({})
		require("mason-lspconfig").setup({
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
