local map = vim.keymap.set
local del = vim.keymap.del

map("n", ";", ":")
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "ss", "<cmd>split<CR>", {desc = "horizontal split"})
map("n", "sv", "<cmd>vsplit<CR>", {desc = "vertical split"})
map("n", "sh", "<C-w>h", { desc = "switch window left" })
map("n", "sl", "<C-w>l", { desc = "switch window right" })
map("n", "sj", "<C-w>j", { desc = "switch window down" })
map("n", "sk", "<C-w>k", { desc = "switch window up" })

map("n", "<Tab>", "<cmd>bnext<CR>")
map("n", "<S-Tab>", "<cmd>bprevious<CR>")
map("n", "<leader>x", "<cmd>bdelete<CR>")

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
map({ "n", "t" }, "<A-v>", "<cmd>ToggleTerm size=65 direction=vertical<Cr>", { desc = "open terminal" })

-- persistence
map("n", "<leader>ss", function() require("persistence").load() end)
map("n", "<leader>qS", function() require("persistence").select() end)
map("n", "<leader>ql", function() require("persistence").load({ last = true }) end)
map("n", "<leader>qd", function() require("persistence").stop() end)
