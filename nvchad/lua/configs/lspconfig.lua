local configs = require("nvchad.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities
local on_init = configs.on_init

local lspconfig = require("lspconfig")

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "pyright", "rust_analyzer", "lua_ls" }

-- command to launch language server
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
