return {
	"eandrju/cellular-automaton.nvim",
	dependencies = {
		"folke/which-key.nvim",
	},
	config = function()
		local wk = require("which-key")
		wk.add({
			{ mode = { "n" } },
			{ "<leader>=", group = "fun ;)" },
			{ "<leader>=g", "<cmd>CellularAutomaton game_of_life<CR>", desc = "Game of Life" },
			{ "<leader>=r", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "Make it rain" },
			{ "<leader>=s", "<cmd>CellularAutomaton scramble<CR>", desc = "Scramble" },
		})
	end,
}
