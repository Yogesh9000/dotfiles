return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "cpp",
      "diff",
      "html",
      "css",
      "javascript",
      "json",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "python",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    },
    indent = {
      enable = true,
      disable = function()
        if vim.bo.filetype == "cpp" or vim.bo.filetype == "c" then
          return true
        end
        return false
      end,
    },
  },
}
