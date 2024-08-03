-- Terminal
vim.api.nvim_create_autocmd({ "TermOpen", "TermEnter", "BufEnter" }, {
  pattern = { "term://*" },
  callback = function()
    vim.wo.relativenumber = false
    vim.wo.number = false
    vim.o.signcolumn = "no"

    vim.cmd([[ startinsert ]])
  end,
})
