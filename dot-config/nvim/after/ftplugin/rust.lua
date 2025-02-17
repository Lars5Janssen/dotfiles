local wk = require("which-key")
wk.add({
	{ mode = "n" },
	{
		"<leader>a",
		function()
			vim.cmd.RustLsp("codeAction")
		end,
		silent = true,
		buffer = vim.api.nvim_get_current_buf(),
	},
	{
		"K",
		function()
			vim.cmd.RustLsp({ "hover", "actions" })
		end,
		silent = true,
		buffer = vim.api.nvim_get_current_buf(),
	},
})
