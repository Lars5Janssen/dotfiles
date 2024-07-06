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

				-- Navigation
				--map("n", "]c", function()
				--	if vim.wo.diff then
				--		vim.cmd.normal({ "]c", bang = true })
				--	else
				--		gitsigns.nav_hunk("next")
				--	end
				--end)

				--map("n", "[c", function()
				--	if vim.wo.diff then
				--		vim.cmd.normal({ "[c", bang = true })
				--	else
				--		gitsigns.nav_hunk("prev")
				--	end
				--end)

				-- Actions
				wk.register({
                    ["[c"] = { function ()
                        if vim.wo.diff then
                            vim.cmd.normal({ "[c", bang = true })
                        else
                            gitsigns.nav_hunk("prev")
                        end
                    end, "[c" },
                    ["]c"] = { function ()
                        if vim.wo.diff then
                            vim.cmd.normal({ "]c", bang = true })
                        else
                            gitsigns.nav_hunk("prev")
                        end
                    end, "]c" },
					["<leader>g"] = {
						name = "+gitsigns",
						s = { gitsigns.stage_hunk, "Stage hunk" },
                        r = { gitsigns.reset_hunk, "Reset hunk" },
                        S = { gitsigns.stage_buffer, "Stage buffer" },
                        u = { gitsigns.undo_stage_hunk, "Undo stage hunk" },
                        R = { gitsigns.reset_buffer, "Reset buffer" },
                        p = { gitsigns.preview_hunk, "Preview hunk" },
                        B = { gitsigns.toggle_current_line_blame, "Toggle current line blame" },
                        t = { gitsigns.toggle_deleted, "Toggle deleted" },
                        b = { function() gitsigns.blame_line({ full = true }) end, "Blame line (full)" },
                        d = { gitsigns.diffthis, "diff this" },
                        D = { function() gitsigns.diffthis("~") end, "diff this ~" },

					},
				})
                wk.register({
                    ["<leader>g"] = {
                        name = "+gitsigns",
                        s = { function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage selected hunk" },
                        r = { function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset selected hunk" },
                    }, { mode = "v" }
                })
				-- Text object
				--map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
			end,
		})
	end,
}
