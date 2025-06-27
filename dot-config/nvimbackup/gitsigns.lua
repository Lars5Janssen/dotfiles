return {
	"lewis6991/gitsigns.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"folke/which-key.nvim",
	},
	config = function()
		local wk = require("which-key")

		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Actions
				wk.add({
					{ "<leader>g", group = "gitsigns" },
					{ mode = "v" },
					{ "<leader>gs", gitsigns.stage_hunk, desc = "Stage hunk" },
					{ "<leader>gr", gitsigns.reset_hunk, desc = "Reset hunk" },
					{ "<leader>gS", gitsigns.stage_buffer, desc = "Stage buffer" },
					{ "<leader>gu", gitsigns.undo_stage_hunk, desc = "Undo stage hunk" },
					{ "<leader>gR", gitsigns.reset_buffer, desc = "Reset buffer" },
					{ "<leader>gp", gitsigns.preview_hunk, desc = "Preview hunk" },
					{ "<leader>gB", gitsigns.toggle_current_line_blame, desc = "Toggle current line blame" },
					{ "<leader>gt", gitsigns.toggle_deleted, desc = "Toggle deleted" },
					{ "<leader>gd", gitsigns.diffthis, desc = "diff this" },
					{
						"<leader>gb",
						function()
							gitsigns.blame_line({ full = true })
						end,
						desc = "Blame line (full)",
					},
					{
						"<leader>gD",
						function()
							gitsigns.diffthis("~")
						end,
						desc = "diff this ~",
					},
					{
						"<leader>gs",
						function()
							gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
						end,
						desc = "Stage selected hunk",
					},
					{
						"<leader>gr",
						function()
							gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
						end,
						desc = "Reset selected hunk",
					},
				})
				wk.add({
					{
						"[c",
						function()
							if vim.wo.diff then
								vim.cmd.normal({ "[c", bang = true })
							else
								gitsigns.nav_hunk("prev")
							end
						end,
						desc = "[c",
					},
					{
						"]c",
						function()
							if vim.wo.diff then
								vim.cmd.normal({ "]c", bang = true })
							else
								gitsigns.nav_hunk("prev")
							end
						end,
						desc = "]c",
					},
				})
				-- Text object
				--map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
			end,
		})
	end,
}
