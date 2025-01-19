local map = vim.keymap.set
local del = vim.keymap.del

map("n", ";", ":", { desc = "Commandline" })
-- map("i", "jk", "<Esc>", { desc = "Normal mode" })
-- map("n", "<leader>bd", LazyVim.ui.bufremove, { desc = "Delete Buffer" })

map("i", "<C-H>", "<C-W>", { desc = "delete previous word" })

-- Snacks Terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
map("n", "<A-v>", function()
  Snacks.terminal()
end, { desc = "Terminal (cwd)" })
map("t", "<A-v>", function()
  Snacks.terminal()
end, { desc = "Hide Teminal" })
