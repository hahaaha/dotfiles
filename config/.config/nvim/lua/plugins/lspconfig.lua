return {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require('blink.cmp').get_lsp_capabilities()


        lspconfig["lua_ls"].setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        })
        lspconfig["html"].setup({})
        lspconfig["ts_ls"].setup({ capabilities = capabilities, })
        lspconfig["hls"].setup({})

        -- local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        lspconfig["cssls"].setup({
            capabilities = capabilities,
        })
        lspconfig["tailwindcss"].setup({ capabilities = capabilities, })
        lspconfig["jsonls"].setup({ capabilities = capabilities, })
        lspconfig["bashls"].setup({})
        lspconfig["cssmodules_ls"].setup({})
        lspconfig["clangd"].setup({})
        lspconfig["prismals"].setup({})
        lspconfig["rust_analyzer"].setup({})
        -- lspconfig["vuels"].setup({})
        lspconfig["eslint"].setup({})
        lspconfig["gopls"].setup({})
        lspconfig["volar"].setup({
            capabilities = capabilities,
            filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
            init_options = {
                typescript = {
                    tsdk = vim.fn.stdpath("data") ..
                        "/mason/packages/typescript-language-server/node_modules/typescript/lib"
                }
            }
        })
    end,
}
