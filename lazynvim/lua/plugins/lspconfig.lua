-- Apply rounded borders to every LSP / diagnostic floating popup.
local border = "single"

return {
  "neovim/nvim-lspconfig",
  init = function()
    -- Hover & signature help (covers every server, present and future)
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

    -- Diagnostic floats (e.g. <leader>cd, vim.diagnostic.open_float)
    vim.diagnostic.config({ float = { border = border } })

    -- Catch-all: any other floating preview (definition peek, references,
    -- third-party plugins using the LSP util helper) inherits the border too.
    local orig_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or border
      return orig_open_floating_preview(contents, syntax, opts, ...)
    end

    -- C/C++: switch between source (.c/.cpp) and header (.h/.hpp) via clangd.
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
      callback = function(ev)
        vim.keymap.set("n", "<leader>ch", "<cmd>LspClangdSwitchSourceHeader<cr>", {
          buffer = ev.buf,
          desc = "Switch Source/Header (clangd)",
        })
      end,
    })
  end,
  opts = {
    inlay_hints = { enabled = false },
    -- Enable lsp cursor word highlighting
    document_highlight = {
      enabled = false,
    },
    servers = {
      lua_ls = {},
      clangd = {
        mason = false,
      },
      pyright = {},
    },
    setup = {},
  },
}
