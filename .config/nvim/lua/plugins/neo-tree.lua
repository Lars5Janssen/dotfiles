return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",
		"folke/which-key.nvim",
	},
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>t", group = "Filetree" },
			{ "<leader>tj", "<cmd>Neotree focus<CR>", desc = "Open Filetree" },
			{ "<leader>tk", "<cmd>Neotree close<CR>", desc = "Close Filetree" },
		})
		-- wk.register({
		-- 	["<leader>t"] = {
		-- 		j = { ":Neotree focus<CR>", "Open Filetree" },
		-- 		k = { ":Neotree close<CR>", "Close Filetree" },
		-- 	},
		-- })
	end,
}
