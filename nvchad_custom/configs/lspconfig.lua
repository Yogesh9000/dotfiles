local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities
local on_init = configs.on_init

local lspconfig = require("lspconfig")

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "pyright", "rust_analyzer" }
local commands = {}
commands.clangd = {
	"clangd",
	"--completion-style=detailed",
	"--header-insertion=never",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_init = on_init,
		on_attach = on_attach,
		capabilities = capabilities,
		cmd = commands[lsp],
	})
end
