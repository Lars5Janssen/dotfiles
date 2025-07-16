return {
	"tris203/precognition.nvim",
	dependencies = { "folke/which-key.nvim" },
	config = function()
		require("precognition").setup()
		require("precognition").toggle()
		local wk = require("which-key")
		wk.add({
			{ mode = "n" },
			{ "<leader>p", group = "precognition" },
			{ "<leader>pp", "<cmd>Precognition peek<CR>", desc = "peek" },
			{ "<leader>pt", "<cmd>Precognition toggle<CR>", desc = "toogle" },
		})
	end,
	opts = {},
}
