local configs = require("nvchad.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities
local on_init = configs.on_init

local lspconfig = require("lspconfig")

-- if you just want default config for the servers then put them in a table
local servers = {
    "html",
    "cssls",
    "tsserver",
    "clangd",
    "pyright",
    "lua_ls",
    "omnisharp",
}

-- command to launch language server
local commands = {}
commands.clangd = {
    "clangd",
    "--completion-style=detailed",
    "--header-insertion=never",
}

-- Specify how the border looks like
local border = {
    { '┌', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '┐', 'FloatBorder' },
    { '│', 'FloatBorder' },
    { '┘', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '└', 'FloatBorder' },
    { '│', 'FloatBorder' },
}

-- Add the border on hover and on signature help popup window
local handlers = {
    ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
    ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

commands.omnisharp = {
    "dotnet",
    "/home/yogesh/.omnisharp/OmniSharp.dll",
}

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        on_init = on_init,
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = commands[lsp],
        handlers = handlers,
    })
end

require('lspconfig').tsserver.setup({
    handlers = {
        ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
        ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
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
})

-- lsp diagnostic
vim.diagnostic.config({
    virtual_text = {
        prefix = "●",
    },
    severity_sort = true,
    update_in_insert = false,
    signs = true,
    float = {
        border = "single",
        suffix = "",
        format = function(diagnostic)
            return string.format(
                "%s (%s) [%s]",
                diagnostic.message,
                diagnostic.source,
                diagnostic.code or diagnostic.user_data.lsp.code
            )
        end,
    },
})

local signs = {
    Error = "",
    Warn = "",
    Hint = " ",
    Info = " ",
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
