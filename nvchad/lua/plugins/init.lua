local overrides = require("configs.overrides")

return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- dofile(vim.g.base46_cache .. "lsp")
            require("nvchad.configs.lspconfig")
            require("configs.lspconfig")
        end, -- Override to setup mason-lspconfig
    },
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
        "stevearc/conform.nvim",
        -- event = "BufWritePre",
        config = function()
            require("configs.conform")
        end,
    },

    {
        "nvim-tree/nvim-tree.lua",
        opts = overrides.nvimtree,
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
        dependencies = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
            },
        },
        opts = overrides.telescope,
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
                    ["core.export"] = {},
                    ["core.completion"] = {
                        config = {
                            engine = "nvim-cmp",
                        },
                    },
                    ["core.concealer"] = {
                        config = {
                            folds = false,
                            icon_preset = "basic",
                            icons = {
                                code_block = {
                                    conceal = true,
                                    width = "fullwidth",
                                },
                            },
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

    -- {
    --     "hrsh7th/nvim-cmp",
    --     opts = function()
    --         local conf = require("nvchad.configs.cmp")
    --         table.insert(conf.sources, { name = "neorg" })
    --         return conf
    --     end,
    -- },

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
    },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
    },

    {
        'numToStr/Comment.nvim',
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
    },
}
