vim.opt.listchars = {
  tab = "> ",
  trail = " ",
  nbsp = "+",
}
vim.g.asmsyntax = "gas"
vim.cmd([[
set cinoptions=l1
]])
vim.opt.cinoptions:append("g0")
