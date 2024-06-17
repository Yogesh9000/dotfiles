require("nvchad.mappings")

local map = vim.keymap.set
local nomap = vim.keymap.del

-- general mappings
map("n", ";", ":", { desc = "CMD enter command mode" })
map("v", ">", ">gv", { desc = "indent" })
-- map("i", "jk", "<ESC>", { desc = "Escape insert mode" })
map("n", "j", "gj", { noremap = true })
map("n", "k", "gk", { noremap = true })
map("n", "gj", "j", { noremap = true })
map("n", "gk", "k", { noremap = true })
map("n", "<leader>X", "<cmd>bdelete<cr>", { silent = true, desc = "buffer delete" })
map("n", "+","<C-a>", { silent = true, desc = "buffer delete" })
map("n", "-","<C-x>", { silent = true, desc = "buffer delete" })

-- split management and movement mappings
map("n", "ss", "<cmd>split<cr>", { desc = "split horizontal" })
map("n", "sv", "<cmd>vsplit<cr>", { desc = "split vertical" })
map("n", "sh", "<C-w>h")
map("n", "sl", "<C-w>l")
map("n", "sj", "<C-w>j")
map("n", "sk", "<C-w>k")

-- specter mappings
map("v", "<leader>sw", '<cmd>lua require("spectre").open_visual()<CR>', { desc = "search current word" })
map("n", "<leader>sw", '<cmd>lua require("spectre").open_visual()<CR>', { desc = "search current word" })
map("n", "<leader>S", "<cmd>lua require('spectre').toggle()<CR>", { desc = "toggle spectre" })
map(
	"n",
	"<leader>sp",
	'<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
	{ desc = "Search on current file" }
)

-- persistence
map("n", "<leader>ss", '<cmd>lua require("persistence").load()<cr>', { desc = "persistence load previous session" })
map(
	"n",
	"<leader>sl",
	'<cmd>lua require("persistence").load({last = true})<cr>',
	{ desc = "persistence load last session" }
)
map("n", "<leader>sq", '<cmd>lua require("persistence").stop()<cr>', { desc = "persistence stop" })

-- conform mappings
map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

-- flash mappings
map("n", "sf", "<cmd>lua require('flash').jump()<cr>", { desc = "flash" })

-- neorg mappings
map("n", "<leader>nn", "<cmd>Neorg index<cr>", { desc = "neorg index" })
map("n", "<leader>nr", "<cmd>Neorg return<cr>", { desc = "neorg return" })

-- term mappings
map({ "n", "t" }, "<A-v>", function()
	require("nvchad.term").toggle({ pos = "vsp", size = 0.5, id = "floo" })
end)
-- map("n", "<leader>rr", function()
-- 	require("nvchad.term").toggle({
-- 		pos = "float",
-- 		cmd = function()
-- 			local file = vim.fn.expand("%")
-- 			local ft_cmds = {
-- 				cpp = "cmake --build build && ./build/" .. file:gsub("%.cpp", ""),
-- 				python = "python " .. file,
-- 			}
-- 			return ft_cmds[vim.bo.ft]
-- 		end,
-- 		id = "cmake",
-- 		clear_cmd = true,
-- 	})
-- end)

-- man pages mappings
map("n", "<C-k>", "K", { noremap = true })

-- tabufline mappings
map("n", "<leader>tm", '<cmd>lua require("nvchad.tabufline").move_buf(1)<cr>', { desc = "move buffer right" })
map("n", "<leader>tM", '<cmd>lua require("nvchad.tabufline").move_buf(-1)<cr>', { desc = "move buffer left" })

-- lsp mappings
map("n", "<C-h>", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "switch header" })

-- telescope mappings
map("n", "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
nomap("n", "<leader>fz")

-- deleted mappings
nomap("n", "<leader>n")
