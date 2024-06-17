local options = {
	lsp_fallback = true,

	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		c = { "clang_format" },
		cpp = { "clang_format" },
		h = { "clang_format" },
		cmake = { "gersemi", "cmake_format" },
		hpp = { "clang_format" },
		sh = { "shfmt" },
		python = { "black" },
		rust = { "rustfmt" },
	},

	-- adding same formatter for multiple filetypes can look too much work for some
	-- instead of the above code you could just use a loop! the config is just a table after all!

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
		async = false,
	},
}

require("conform").setup(options)
