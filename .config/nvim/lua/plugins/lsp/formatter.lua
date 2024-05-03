return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				java = { "google-java-format" },
				bash = { "beautysh" },
				rust = { "rustfmt" },
				yaml = { "yamlfix" },
				toml = { "taplo" },
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>lf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })

		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function(args)
				conform.format({ bufnr = args.buf })
			end,
		})
	end,
}
