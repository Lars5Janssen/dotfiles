return {
	{
		"williamboman/mason.nvim",
		opts = require("plugins.configs.mason"),
		cmd = { "Mason", "MasonInstall", "MasonUpdate" },
		config = function(_, opts)
			require("mason").setup(opts)
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = require("plugins.configs.mason"),
		cmd = {
			"MasonToolsInstall",
			"MasonToolsInstallSync",
			"MasonToolsUpdate",
			"MasonToolsUpdateSync",
			"MasonToolsClean",
		},
		build = ':execute "MasonToolsClean" | "MasonToolsInstall | "MasonToolsUpdate"',
		config = function(_, opts)
			require("mason-tool-installer").setup(opts)
		end,
	},
}
