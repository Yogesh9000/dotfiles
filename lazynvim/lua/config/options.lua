vim.opt.listchars = {
  tab = "> ",
  trail = " ",
  nbsp = "+",
}
vim.g.asmsyntax = "gas"
vim.opt.cinoptions:append({ "l1", "g0" })
vim.o.relativenumber = false

if vim.fn.has("win32") then
  vim.o.shell = "pwsh.exe -NoLogo"
end
