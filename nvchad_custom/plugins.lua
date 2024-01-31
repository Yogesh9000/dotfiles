local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/neodev.nvim",
				opts = {},
				config = true,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				lazy = true,
				config = function()
					require("nvim-treesitter.configs").setup({
						textobjects = {
							select = {
								enable = true,

								-- Automatically jump forward to textobj, similar to targets.vim
								lookahead = true,

								keymaps = {
									-- You can use the capture groups defined in textobjects.scm
									["af"] = { query = "@function.outer", desc = "Select function" },
									["if"] = { query = "@function.inner", desc = "Select inside function" },
									["ac"] = { query = "@class.outer", desc = "Select class" },
									["ic"] = { query = "@class.inner", desc = "Select inside class" },
									["ip"] = { query = "@parameter.inner", desc = "Select inside parameter" },
									["aC"] = { query = "@comment.outer", desc = "Select comment" },
								},
								selection_modes = {
									["@parameter.inner"] = "v",
									["@function.inner"] = "v",
									["@function.outer"] = "V",
									["@class.outer"] = "V",
									["@class.inner"] = "v",
									["@comment.outer"] = "v",
								},
							},
							swap = {
								enable = true,
								swap_next = {
									["<leader>pn"] = "@parameter.inner",
								},
								swap_previous = {
									["<leader>pp"] = "@parameter.inner",
								},
							},
						},
					})
				end,
			},
		},
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"stevearc/conform.nvim",
		-- for users those who want auto-save conform + lazyloading!
		event = "BufWritePre",
		config = function()
			require("custom.configs.conform")
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		version = "3.5.0",
		main = "ibl",
		init = function() end,
		event = { "BufEnter" },
		config = function()
			require("ibl").setup(overrides.indentblankline)
		end,
	},

	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufEnter" },
		opts = {
			filetypes = { "css, html, javascript, javascriptreact" },
		},
	},

	{
		"nvim-telescope/telescope.nvim",
		opts = overrides.telescope,
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
		},
	},

	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		opts = overrides.persistence,
	},
	{
		"nvim-pack/nvim-spectre",
		lazy = true,
		config = true,
	},

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
    -- stylua: ignore
    keys = {
      { "sf", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
	},

	{
		"nvim-neorg/neorg",
		version = "7.0.0",
		build = ":Neorg sync-parsers",
		-- tag = "*",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "Neorg" },
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.completion"] = {
						config = {
							engine = "nvim-cmp",
						},
					},
					["core.concealer"] = {
						config = {
							folds = false,
						},
					}, -- Adds pretty icons to your documents
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = "~/Dev/notes",
							},
							default_workspace = "notes",
						},
					},
				},
			})
		end,
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- {
	-- 	"akinsho/toggleterm.nvim",
	-- 	version = "*",
	-- 	event = "VeryLazy",
	-- 	config = true,
	-- },

	-- {
	-- 	"Civitasv/cmake-tools.nvim",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("cmake-tools").setup({
	-- 			cmake_runner = {
	-- 				name = "toggleterm",
	-- 			},
	-- 		})
	-- 	end,
	-- },
}

return plugins
