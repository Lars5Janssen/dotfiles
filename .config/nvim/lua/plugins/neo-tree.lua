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
        wk.register({
            ["<leader>t"] = {
                name = "+Filetree",
                j = { ":Neotree focus<CR>", "Open Filetree" },
                k = { ":Neotree close<CR>", "Close Filetree" },
            }
        })
	end,
}
