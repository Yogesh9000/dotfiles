-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.opt.relativenumber = true
vim.opt.whichwrap = "<>[]"
vim.opt.foldlevelstart = 99
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.cmd([[let g:rust_recommended_style = v:false]])
