return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "folke/which-key.nvim",
        { "echasnovski/mini.nvim", version = "*" },
    },
    config = function()
        local wk = require("which-key")
        local builtin = require("telescope.builtin")
        wk.add({
            { "<leader>f",  group = "telescope" },
            { "<leader>fb", builtin.find_files, desc = "Find in Buffers" },
            { "<leader>ff", builtin.live_grep,  desc = "Find files" },
            { "<leader>fg", builtin.buffers,    desc = "Live grep" },
            { "<leader>fh", builtin.help_tags,  desc = "Help tags" },
            -- ["<leader>f"] = {
            --     name = "+telescope",
            --     f = { builtin.find_files, "Find files" },
            --     g = { builtin.live_grep, "Live grep" },
            --     b = { builtin.buffers, "Find in Buffers" },
            --     h = { builtin.help_tags, "Help tags" },
            -- }
        })
    end,
}
