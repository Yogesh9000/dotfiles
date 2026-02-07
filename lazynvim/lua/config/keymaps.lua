local map = vim.keymap.set
local del = vim.keymap.del

map("n", ";", ":", { desc = "Commandline" })
-- map("i", "jk", "<Esc>", { desc = "Normal mode" })
-- map("n", "<leader>bd", LazyVim.ui.bufremove, { desc = "Delete Buffer" })

-- some terminal emulators send C-BS as C-H so need to define terminal emulator specific bindings
map("i", "<C-H>", "<C-W>", { desc = "delete previous word" }) -- alacrityy
-- map("i", "<C-BS>", "<C-W>", { desc = "delete previous word" }) -- kitty

-- Snacks Terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
map("n", "<A-v>", function()
  Snacks.terminal(nil, { win = { position = "left" }})
end, { desc = "Terminal (cwd)" })
map("t", "<A-v>", function()
  Snacks.terminal(nil, { win = { position = "left" }})
end, { desc = "Hide Teminal" })
