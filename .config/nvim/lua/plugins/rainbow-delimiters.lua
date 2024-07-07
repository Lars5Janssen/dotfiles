return {
	"HiPhish/rainbow-delimiters.nvim",
	event = "VeryLazy",
	config = function()
		local rainbow_delimiters = require("rainbow-delimiters")
		---@type rainbow_delimiters.config
		vim.g.rainbow_delimiters = {
			highlight = {
				"RainbowDelimiterRed",
				"RainbowDelimiterYellow",
				"RainbowDelimiterBlue",
				"RainbowDelimiterOrange",
				"RainbowDelimiterViolet",
				"RainbowDelimiterCyan",
			},
		}
	end,
}
