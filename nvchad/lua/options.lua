require("nvchad.options")

vim.opt.relativenumber = true
vim.opt.whichwrap = "[]"
vim.opt.foldlevelstart = 99
vim.opt.linebreak = true
vim.opt.breakindent = true

vim.opt.tabstop = 4 -- A TAB character looks like 4 spaces
vim.opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.opt.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.opt.shiftwidth = 4 -- Number of spaces inserted when indenting

-- autoclose terminal on exit
vim.api.nvim_create_autocmd("TermClose", {
    callback = function()
        vim.cmd("bdelete")
    end,
})
