return {
	"folke/which-key.nvim",
	config = function()
		local wk = require("which-key")
		wk.add({
			{ mode = { "n" } },
			{ "<leader>n", group = "tabs & files" },
			{ "<leader>nn", "<cmd>tabnew<CR>", desc = "new tab" },
			{ "<leader>nc", "<cmd>tabclose<CR>", desc = "new tab" },
			-- { "<leader>nw", group = "Write & Quit File(s)" },
			-- { "<leader>nwq", group = "Write Quit File(s)" },
			-- { "<leader>nwqq", "<cmd>wq<CR>", desc = "Write Quit" },
			-- { "<leader>nwqa", "<cmd>wqa<CR>", desc = "Write Quit All" },
			-- { "<leader>nwa", "<cmd>wa<CR>", desc = "Write All" },
			-- { "<leader>nf", group = "Force Write OR Quit File(s)" },
			-- { "<leader>nfw", group = "Force Write & Quit File(s)" },
			-- { "<leader>nfwqq", "<cmd>wq!<CR>", desc = "Force Write Quit" },
			-- { "<leader>nfwa", "<cmd>wa!<CR>", desc = "Force Write All" },
			-- { "<leader>nfwqa", "<cmd>wqa!<CR>", desc = "Force Write Quit All" },
			-- { "<leader>nfq", group = "Force Quit File(s)" },
			-- { "<leader>nfqq", "<cmd>q!<CR>", desc = "Force Quit" },
			-- { "<leader>nfqa", "<cmd>qa!<CR>", desc = "Force Quit ALL" },
		})
	end,
}
