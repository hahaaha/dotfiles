local silent = { silent = true }
vim.g.mapleader = " "
-- local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<A-e>", "<cmd>NvimTreeToggle<CR>")

vim.keymap.set("n", "<C-p>", "<cmd>FzfLua files<cr>")
vim.keymap.set("n", "<leader>f", "<cmd>FzfLua live_grep<cr>")
-- vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>")
-- vim.keymap.set("n", "<leader>f", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>v", "<cmd>Telescope git_status<cr>")
-- vim.keymap.set('n', '<C-p>', builtin.find_files, silent)

-- bufferline
vim.keymap.set("n", "]b", "<cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<CR>")

-- vim.api.nvim_create_autocmd("LspAttach", {
--     callback = function(ev)
--         local opts = { buffer = ev.buf }
--         vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
--     end,
-- })
--

-- copy
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>p", '"+p')

-- lspsaga
-- diagnostic
vim.keymap.set("n", "[n", "<cmd>Lspsaga diagnostic_jump_next<CR>")
vim.keymap.set("n", "[lspk", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
-- definition
vim.keymap.set("n", "gpd", "<cmd>Lspsaga peek_definition<CR>")
vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
vim.keymap.set("n", "got", "<cmd>Lspsaga goto_type_definition<CR>")
-- code action
vim.keymap.set("n", "[e", "<cmd>Lspsaga code_action<CR>")
vim.keymap.set("n", "[r", "<cmd>Lspsaga finder<CR>")

-- trouble
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>")

-- icn-rename
vim.keymap.set("n", "<leader>rn", function()
    return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })



local function set_terminal_keymaps()
    local opts = { buffer = true, silent = true }

    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)

    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)

    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.api.nvim_create_autocmd('TermOpen', {
    pattern = 'term://*',
    callback = set_terminal_keymaps,
})
