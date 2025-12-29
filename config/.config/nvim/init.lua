local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local function tmux(cmd)
    vim.fn.system("tmux " .. cmd)
end

-- 进入 nvim
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.env.TMUX then
            tmux("set -g mouse off")
        end
    end,
})

-- 退出 nvim
vim.api.nvim_create_autocmd("VimLeave", {
    callback = function()
        if vim.env.TMUX then
            tmux("set -g mouse on")
        end
    end,
})

require("options")
require("keymaps")
require("lazy").setup("plugins")
require("lsp.init")
