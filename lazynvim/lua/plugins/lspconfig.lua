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
      html = {
        handlers = handlers,
      },
      cssls = {
        handlers = handlers,
      },
      tailwindcss = {
        handlers = handlers,
      },
      lua_ls = {
        handlers = handlers,
      },
      emmet_ls = {
        handlers = handlers,
      },
      clangd = {
        handlers = handlers,
      },
      pyright = {
        handlers = handlers,
      },
      tsserver = {
        handlers = {
          ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
          ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
          ["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
            if result.diagnostics == nil then
              return
            end
            -- ignore some tsserver diagnostics
            local idx = 1
            while idx <= #result.diagnostics do
              local entry = result.diagnostics[idx]
              -- codes: https://github.com/microsoft/TypeScript/blob/main/src/compiler/diagnosticMessages.json
              if entry.code == 80001 then
                -- { message = "File is a CommonJS module; it may be converted to an ES module.", }
                table.remove(result.diagnostics, idx)
              else
                idx = idx + 1
              end
            end
            vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
          end,
        },
      },
    },
    setup = {},
  },
}
