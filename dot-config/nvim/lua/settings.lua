vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.smartindent = true
vim.wo.wrap = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.foldmethod = indent
--vim.opt.colorcolumn = "80"
vim.opt.expandtab = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "*",
    callback = function()
        vim.opt.formatoptions:remove({ "o" })
    end,
})
