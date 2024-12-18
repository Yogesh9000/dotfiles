return {
  "folke/edgy.nvim",
  opts = {
    right = {
      {
        ft = "snacks_terminal",
        size = { width = 0.4 },
        filter = function(buf, win)
          return vim.api.nvim_win_get_config(win).relative == ""
        end,
      },
    },
  },
}
