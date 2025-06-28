return {
	"smjonas/inc-rename.nvim",
	dependencies = {
		"folke/which-key.nvim",
	},
	config = function()
		require("inc_rename").setup()
		local wk = require("which-key")
		wk.add({
			{ mode = "n" },
			{
				"<leader>rn",
				":IncRename ",
			},
			{
				"<leader>re",
				function()
					return ":IncRename " .. vim.fn.expand("<cword>")
				end,
				expr = true,
			},
		})
	end,
}
