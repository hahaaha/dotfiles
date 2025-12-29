return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            typescriptreact = { "prettier" },
            typescript = { "prettier" },
            vue = { "prettier" },
            json = { "prettier" },
        },
        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 500,
            lsp_fallback = true,
        },
    },
}
