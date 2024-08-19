local map = vim.keymap.set
local del = vim.keymap.del

map("n", ";", ":", { desc = "Commandline" })
-- map("i", "jk", "<Esc>", { desc = "Normal mode" })
map("n", "<leader>bd", LazyVim.ui.bufremove, { desc = "Delete Buffer" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
map({ "n", "t" }, "<A-v>", "<cmd>ToggleTerm size=65 direction=vertical<Cr>", { desc = "open terminal" })
