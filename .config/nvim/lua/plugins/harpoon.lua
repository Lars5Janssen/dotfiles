return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "folke/which-key.nvim",
    },
    config = function()
        local harpoon = require("harpoon")
        local wk = require("which-key")

        harpoon:setup()
        wk.register({
            ["<leader>h"] = {
                name = "+harpoon",
                a = { function() harpoon:list():add() end, "Add File to Harpoon"},
                e = { function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "Toggle Harpoon Menu"},
                ["1"] = { function() harpoon:list():select(1) end, "Select first harpoon entry"},
                ["2"] = { function() harpoon:list():select(2) end, "Select second harpoon entry"},
                ["3"] = { function() harpoon:list():select(3) end, "Select third harpoon entry"},
                ["4"] = { function() harpoon:list():select(4) end, "Select fourth harpoon entry"},
            },
        })
        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-P>", function()
            harpoon:list():prev()
        end)
        vim.keymap.set("n", "<C-N>", function()
            harpoon:list():next()
        end)
    end,
}
