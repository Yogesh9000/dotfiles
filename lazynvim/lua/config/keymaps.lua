local map = vim.keymap.set
local del = vim.keymap.del

map("n", ";", ":", { desc = "Commandline" })
-- map("i", "jk", "<Esc>", { desc = "Normal mode" })
-- map("n", "<leader>bd", LazyVim.ui.bufremove, { desc = "Delete Buffer" })

map("i", "<C-BS>", "<C-W>", { desc = "delete previous word" })
