local border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}

-- Add the border on hover and on signature help popup window
local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    -- Enable lsp cursor word highlighting
    document_highlight = {
      enabled = false,
    },
    servers = {
      lua_ls = {
        handlers = handlers,
      },
      clangd = {
        mason = false,
        handlers = handlers,
      },
      pyright = {
        handlers = handlers,
      },
    },
    setup = {},
  },
}
