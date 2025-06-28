return {
	"leath-dub/snipe.nvim",
	dependencies = { "folke/which-key.nvim" },
	config = function()
		local wk = require("which-key")
		local snipe = require("snipe")
		snipe.setup()
		wk.add({
			{ mode = { "n" } },
			{
				"<leader>b",
				function()
					require("snipe").open_buffer_menu()
				end,
				desc = "Open Snipe buffer menu",
			},
		})
	end,
}
