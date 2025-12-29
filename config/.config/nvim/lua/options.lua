-- tab
vim.opt.tabstop = 4     -- number of visual spaces per TAB
vim.opt.shiftwidth = 4  -- insert 4 spaces on a tab
vim.opt.softtabstop = 4 -- number of spacesin tab when editing
vim.opt.expandtab = true
vim.opt.relativenumber = true
vim.opt.number = true

-- fold
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
-- 不可见字符
vim.o.list = true
vim.o.listchars = "tab:>~,space:·"
vim.opt.fileformat = "unix"
-- mouse
vim.opt.mouse = ""

-- 在最后一行的时候自动滚动
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- sgin 区域长存
vim.o.signcolumn = "yes"

-- UI
--
vim.diagnostic.config({ virtual_text = true })

local signs = {
    [vim.diagnostic.severity.ERROR] = " ",
    [vim.diagnostic.severity.WARN] = " ",
    [vim.diagnostic.severity.HINT] = " ",
    [vim.diagnostic.severity.INFO] = " "
}


vim.diagnostic.config({
    signs = {
        text = signs,
    }
})

local lspui_ok, lspui = pcall(require, "lspconfig.ui.windows")
if not lspui_ok then
    return
end

vim.opt.spell = true
vim.opt.spelllang = { "en_us" }
