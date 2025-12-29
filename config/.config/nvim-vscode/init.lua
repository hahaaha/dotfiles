-- ~/.config/nvim-vscode/init.lua
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local opts = { noremap = true, silent = true }

-- 关闭当前标签页
vim.keymap.set("n", "<leader>q", "<Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>", opts)

-- 关闭其他标签页
vim.keymap.set("n", "<leader>o", "<Cmd>call VSCodeNotify('workbench.action.closeOtherEditors')<CR>", opts)


require("lazy").setup({
    { "folke/flash.nvim", opts = {} },
})

-- 让 zc/zo/zM/zR 生效
vim.api.nvim_set_keymap("n", "zc", ":call VSCodeNotify('editor.fold')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "zo", ":call VSCodeNotify('editor.unfold')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "zM", ":call VSCodeNotify('editor.foldAll')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "zR", ":call VSCodeNotify('editor.unfoldAll')<CR>", { noremap = true, silent = true })
