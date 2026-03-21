return {
  "mason-org/mason.nvim",
  opts = {
    registries = {
      "github:mason-org/mason-registry",
      "github:Crashdummyy/mason-registry",
    },
    ensure_installed = {
      -- "html-lsp",
      -- "css-lsp",
      -- "tailwindcss-language-server",
      "lua-language-server",
      -- "emmet-ls",
      "clangd",
      "clang-format",
      "pyright",
      -- "typescript-language-server ",
    },
  },
}
