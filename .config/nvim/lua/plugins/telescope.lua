return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.x",
	dependencies = {
        "nvim-lua/plenary.nvim",
        "folke/which-key.nvim",
    },
	config = function()
        local wk = require("which-key")
		local builtin = require("telescope.builtin")
        wk.register({
            ["<leader>f"] = {
                name = "+telescope",
                f = { builtin.find_files, "Find files" },
                g = { builtin.live_grep, "Live grep" },
                b = { builtin.buffers, "Find in Buffers" },
                h = { builtin.help_tags, "Help tags" },
            }
        })
	end,
}
