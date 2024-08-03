return {
  "lukas-reineke/indent-blankline.nvim",
  opts = {
    indent = {
      char = "│",
      smart_indent_cap = true,
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
  },
}
