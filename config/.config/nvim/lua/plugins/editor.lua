return {
    -- {
    --     "rachartier/tiny-inline-diagnostic.nvim",
    --     event = "VeryLazy", -- Or `LspAttach`
    --     priority = 1000,    -- needs to be loaded in first
    --     config = function()
    --         require('tiny-inline-diagnostic').setup()
    --     end
    -- },
    {
        "hedyhli/outline.nvim",
        lazy = true,
        cmd = { "Outline", "OutlineOpen" },
        keys = { -- Example mapping to toggle outline
            { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
        },
        opts = {
            -- Your setup opts here
        },
    },

    -- {
    --     'nvimdev/dashboard-nvim',
    --     event = 'VimEnter',
    --     config = function()
    --         require('dashboard').setup {
    --             -- config
    --         }
    --     end,
    --     dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    -- },
    {
        "mvllow/modes.nvim",
        config = function()
            require("modes").setup({
                line_opacity = 0.3,
            })
        end,
    },
    -- { 'danilamihailov/beacon.nvim' },
    -- {
    --     "sphamba/smear-cursor.nvim",
    --     opts = {},
    -- },
    -- {
    --     'stevearc/dressing.nvim',
    --     opts = {},
    -- },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup({
                hijack_cursor = true,

                update_focused_file = {
                    enable = true,
                    update_cwd = true,
                    ignore_list = {}
                },
                filters = {
                    dotfiles = false,
                    git_ignored = false,
                    -- custom = { '.git' }
                },
                view = {
                    adaptive_size = true,
                    relativenumber = true,
                    number = true,
                },
                renderer = {
                    indent_markers = {
                        enable = true,
                    },
                },
                diagnostics = {
                    enable = true,
                },
            })
        end,
    },
    -- {
    --     "smjonas/inc-rename.nvim",
    --     config = function()
    --         require("inc_rename").setup()
    --     end,
    -- },
    -- {
    --     "gen740/SmoothCursor.nvim",
    --     config = function()
    --         require("smoothcursor").setup()
    --     end,
    -- },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            pickers = {
                find_files = {
                    -- theme = "dropdown",
                },
            },
        },
    },
    {
        {
            'akinsho/toggleterm.nvim',
            version = "*",
            opts = {
                open_mapping = [[<c-\>]],
                direction = "float",
                hide_numbers = false,
                float_opts = {
                },
                on_open = function()
                    vim.cmd('echo "enabled mouse"')
                    vim.o.mouse = "a"
                end,
                on_close = function()
                    vim.cmd('echo "disabled mouse"')
                    vim.o.mouse = ""
                end,
                winbar = {
                    enabled = true,
                },
            }
        }
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            messages = { view = "mini" },
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                },
                signature = {
                    -- enabled = false,
                },
                presets = {
                    bottom_search = true,         -- use a classic bottom cmdline for search
                    command_palette = true,       -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false,       --
                }
            },
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
    },
    -- {
    --     "karb94/neoscroll.nvim",
    --     config = function()
    --         require('neoscroll').setup {}
    --     end
    -- },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        }
    },
}
