return {
	"ellisonleao/glow.nvim",
	config = function()
		require("glow").setup({
			width_ratio = 1,
			height_ratio = 1,
		})
	end,
}
