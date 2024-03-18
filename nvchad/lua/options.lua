require("nvchad.options")

vim.opt.relativenumber = true
vim.opt.whichwrap = "<>[]"
vim.opt.foldlevelstart = 99
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.cmd([[let g:rust_recommended_style = v:false]])

-- autoclose terminal on exit
vim.api.nvim_create_autocmd("TermClose", {
	callback = function()
		vim.cmd("bdelete")
	end,
})
