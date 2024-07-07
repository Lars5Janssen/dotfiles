return {
    "stevearc/conform.nvim",
    dependencies = {
        "folke/which-key.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local wk = require("which-key")
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
               lua = { "stylua" },
                --java = { "google-java-format" },
                markdown = { { "prettierd", "prettier" } },
                bash = { "beautysh" },
                rust = { "rustfmt" },
                yaml = { "yamlfix" },
                toml = { "taplo" },
            },
            format_on_save = {
                timeout = 500,
                lsp_fallback = false,
            },
        })

        wk.register({
            ["<leader>lf"] = { function()
                conform.format({
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 500,
                })
            end, "Format file or range" },
            { mode = { "n", "v" } },
        })
    end,
}
