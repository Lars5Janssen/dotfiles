return {
	"mfussenegger/nvim-lint",
	dependencies = {
		"folke/which-key.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		local wk = require("which-key")

		lint.linters_by_ft = {
			--Lua = { "luacheck" },
			-- markdown = { "woke", "write_good", }
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,

			callback = function()
				lint.try_lint()
			end,
		})

		wk.add({
			{ "<leader>l", group = "linting" },
			{
				"<leader>ll",
				function()
					lint.try_lint()
				end,
				desc = "Trigger linting for current file",
			},
		})
	end,
}
