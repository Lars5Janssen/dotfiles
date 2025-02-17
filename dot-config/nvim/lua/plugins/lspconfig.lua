return {

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/which-key.nvim",
		},
		lazy = false,
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local wk = require("which-key")
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			lspconfig.autotools_ls.setup({})
			lspconfig.gopls.setup({})
			lspconfig.bashls.setup({})
			lspconfig.docker_compose_language_service.setup({})
			lspconfig.dockerls.setup({})
			-- lspconfig.rustowllsp.setup({})
			-- lspconfig.rust_analyzer.setup({})
			lspconfig.jedi_language_server.setup({})
			lspconfig.basedpyright.setup({})
			lspconfig.jsonls.setup({})
			lspconfig.taplo.setup({})
			lspconfig.yamlls.setup({})
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
							disable = { "different-requires" },
						},
					},
				},
			})

			for _, method in ipairs({ "textDocument/diagnostic", "workspace/diagnostic" }) do
				local default_diagnostic_handler = vim.lsp.handlers[method]
				vim.lsp.handlers[method] = function(err, result, context, config)
					if err ~= nil and err.code == -32802 then
						return
					end
					return default_diagnostic_handler(err, result, context, config)
				end
			end
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
		end,
	},
}
