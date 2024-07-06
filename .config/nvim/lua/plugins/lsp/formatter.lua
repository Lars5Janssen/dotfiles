return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				--lua = { "stylua" },
				--java = { "google-java-format" },
				markdown = { { "prettierd", "prettier" } },
				bash = { "beautysh" },
				rust = { "rustfmt" },
				yaml = { "yamlfix" },
				toml = { "taplo" },
			},
			format_on_save = {
				timeout = 500,
				lsp_fallback = false,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>lf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
