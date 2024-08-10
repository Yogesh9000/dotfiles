local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

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

-- Disable spell check
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.spell = false
  end,
})
