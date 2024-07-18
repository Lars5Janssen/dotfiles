return {
	{
		"ellisonleao/glow.nvim",
		config = function()
			require("glow").setup({
				width_ratio = 1,
				height_ratio = 1,
			})
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
}
