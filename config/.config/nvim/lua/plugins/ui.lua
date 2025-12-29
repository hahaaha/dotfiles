return {
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                -- sections = { lualine_c = { require("auto-session.lib").current_session_name } },
            })
        end,
    },
    -- {
    --     "lukas-reineke/indent-blankline.nvim",
    --     main = "ibl",
    --     opts = {
    --         indent = {
    --             char = "|",
    --         },
    --         whitespace = {},
    --     },
    -- },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bufferline").setup({
                options = {
                    diagnostics = "nvim_lsp",
                    indicator = {
                        style = "underline",
                    },
                },
            })
        end,
    },
    {
        "b0o/incline.nvim",
        config = function()
            local helpers = require("incline.helpers")
            local devicons = require("nvim-web-devicons")
            require("incline").setup({
                window = {
                    padding = 0,
                    margin = { horizontal = 0 },
                },
                render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
                    if filename == "" then
                        filename = "[No Name]"
                    end
                    local ft_icon, ft_color = devicons.get_icon_color(filename)
                    local modified = vim.bo[props.buf].modified
                    return {
                        ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or
                        "",
                        " ",
                        { filename, gui = modified and "bold,italic" or "bold" },
                        " ",
                        guibg = "#44406e",
                    }
                end,
            })
        end,
        -- Optional: Lazy load Incline
        event = "VeryLazy",
    },
    {
        "nvim-zh/colorful-winsep.nvim",
        config = true,
        event = { "WinLeave" },
    }

}
