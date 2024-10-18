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
        wk.add({
            { "<leader>h", group = "harpoon" },
            {
                "<leader>ha",
                function()
                    harpoon:list():add()
                end,
                desc = "Add File to Harpoon",
            },
            {
                "<leader>he",
                function()
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
                desc = "Toggle Harpoon Menu",
            },
            {
                "<leader>h!",
                function()
                    harpoon:list():select(1)
                end,
                desc = "Select first harpoon entry",
            },
            {
                "<leader>h@",
                function()
                    harpoon:list():select(2)
                end,
                desc = "Select second harpoon entry",
            },
            {
                "<leader>h#",
                function()
                    harpoon:list():select(3)
                end,
                desc = "Select third harpoon entry",
            },
            {
                "<leader>h$",
                function()
                    harpoon:list():select(4)
                end,
                desc = "Select fourth harpoon entry",
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
