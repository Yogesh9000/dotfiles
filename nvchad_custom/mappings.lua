---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- general
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["ss"] = { "<cmd>split<cr>", "split screen", opts = { nowait = true, silent = true } },
    ["sv"] = { "<cmd>vsplit<cr>", "split screen vertical", opts = { nowait = true, silent = true } },
    ["sh"] = { "<C-w>h", "right window", opts = { nowait = true, silent = true } },
    ["sl"] = { "<C-w>l", "left window", opts = { nowait = true, silent = true } },
    ["sj"] = { "<C-w>j", "bottom window", opts = { nowait = true, silent = true } },
    ["sk"] = { "<C-w>k", "top window", opts = { nowait = true, silent = true } },
    ["<leader>tt"] = { "<cmd>tabedit<cr>", "new tab", opts = { nowait = true, silent = true } },
    ["<leader>tH"] = {
      "<cmd>lua require('base46').toggle_theme()<cr>",
      "toogle theme",
      opts = { nowait = true, silent = true },
    },
    ["<leader>rc"] = { ":%s/\\r//g<cr>", "Delete M^", opts = { silent = true } },
    -- spectre
    ["<leader>S"] = { "<cmd>lua require('spectre').toggle()<CR>", "Toggle Spectre" },
    ["<leader>sw"] = {
      '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
      "Search current word",
    },
    ["<leader>sp"] = {
      '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
      "Search on current file",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["<leader>sw"] = {
      '<cmd>lua require("spectre").open_visual()<CR>',
      "Search current word",
    },
  },
}

M.conform = {
  plugin = true,
  n = {
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
  },
}

M.persistence = {
  n = {
    ["<leader>ss"] = {
      '<cmd>lua require("persistence").load()<cr>',
      "load session",
      opts = { nowait = true, silent = true },
    },
    ["<leader>sl"] = {
      '<cmd>lua require("persistence").load({last = true})<cr>',
      "load last session",
      opts = { nowait = true, silent = true },
    },
    ["<leader>sq"] = {
      '<cmd>lua require("persistence").stop()<cr>',
      "load last session",
      opts = { nowait = true, silent = true },
    },
  },
}

M.tabufline = {
  plugin = true,
  n = {
    ["<leader>tm"] = {
      '<cmd>lua require("nvchad.tabufline").move_buf(1)<cr>',
      "move buffer right",
      opts = { nowait = true, silent = true },
    },
    ["<leader>tM"] = {
      '<cmd>lua require("nvchad.tabufline").move_buf(-1)<cr>',
      "move buffer right",
      opts = { nowait = true, silent = true },
    },
    ["<leader>tq"] = {
      "<cmd>lua require('nvchad.tabufline').closeAllBufs()<cr>",
      "close all buffers in tab",
      opts = { nowait = true, silent = true },
    },
    ["<leader>tc"] = {
      "<cmd>tabclose<cr>",
      "close tab",
      opts = { nowait = true, silent = true },
    },
    ["<leader>tn"] = { "<cmd>tabnext<cr>", "next tab", opts = { nowait = true, silent = true } },
    ["<leader>tp"] = { "<cmd>tabprevious<cr>", "previous tab", opts = { nowait = true, silent = true } },
  },
}
return M
