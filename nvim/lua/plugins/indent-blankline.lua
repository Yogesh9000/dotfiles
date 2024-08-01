return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {
    indent = {
      char = "│",
      smart_indent_cap = true,
    },
    exclude = {
      filetypes = {
        "nvimtree",
        "help",
        "terminal",
        "lazy",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "mason",
        "norg",
        "",
      },
    },
    whitespace = {
      highlight = { "Whitespace" },
    },
    scope = {
      highlight = { "Function" },
      exclude = {},
      show_start = false,
      show_end = false,
    },
  }
}
