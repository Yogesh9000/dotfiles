return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    use_popups_for_input = false,
  },
  keys = {
    { "<leader>e", "<cmd>Neotree focus<Cr>", desc = "NeoTree focus" },
    { "<C-n>", "<cmd>Neotree toggle<Cr>", desc = "NeoTree focus" },
  },
}
