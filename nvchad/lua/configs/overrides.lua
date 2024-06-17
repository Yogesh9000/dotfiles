local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"c",
		"cpp",
		"rust",
		"toml",
		"markdown",
		"markdown_inline",
		"python",
		"yaml",
	},
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "si", -- set to `false` to disable one of the mappings
			node_incremental = "sn",
			scope_incremental = "sa",
			node_decremental = "sm",
		},
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		-- "deno",
		"prettier",

		-- c/cpp stuff
		"clangd",
		"clang-format",
		"rust-analyzer",

		-- python stuff
		"pyright",
		"black",
	},
}

-- git support in nvimtree
M.nvimtree = {
	actions = {
		change_dir = {
			enable = true,
			global = true,
		},
	},
	git = {
		enable = true,
		ignore = false,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
			glyphs = {
				folder = {
					-- default = "",
					-- open = "",
				},
				git = {
					ignored = "",
				},
			},
		},
	},
}

M.persistence = {}
M.indentblankline = {
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

M.telescope = {
	defaults = {
		file_ignore_patterns = { ".clangd" },
	},
	extensions_list = { "themes", "terms", "fzf" },
}

return M
