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

-- wrap git commit messages to 72 characters
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit" },
  callback = function()
    vim.bo.textwidth = 72
  end,
  desc = "limit git commit messages to 72 charaters",
})

-- Disable autoformat for cpp, c, hpp, h files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "cpp", "c", "hpp", "h" },
  callback = function()
    vim.b.autoformat = false
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.ebnf" },
  callback = function()
    vim.bo.filetype = "ebnf"
  end,
})
