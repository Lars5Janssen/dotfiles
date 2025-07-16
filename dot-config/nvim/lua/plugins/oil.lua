return {
	"stevearc/oil.nvim",
	dependencies = {
		"folke/which-key.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local wk = require("which-key")
		require("oil").setup({
			default_file_explorer = false,
			skip_confirm_for_simple_edits = true,
		})
		wk.add({
			{ mode = "n" },
			{ "-", "<cmd>Oil<CR>", desc = "Open File Browser" },
		})
	end,
}
