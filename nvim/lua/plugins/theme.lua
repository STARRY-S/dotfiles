return {
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000,
        config = function()
            require("onedarkpro").setup({
                styles = {
                    comments = "italic",
                    functions = "bold",
                },
                colors = {
                    purple = "#ababab",
                },
                highlights = {
                    LiteralTabError = { bg = "#753e3e" },
                    NvimTreeFolderIcon = { fg = blue },
                    NvimTreeFolderName = { fg = blue },
                    NvimTreeRootFolder = { fg = blue },
                    NvimTreeOpenedFolderName = { fg = blue },
                    NvimTreeCursorLine = { bg = "#2c323c" },
                },
            })
            vim.cmd("colorscheme onedark_vivid")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = 'ayu',
                    component_separators = { left = '', right = ''},
                    section_separators = { left = '', right = ''},
                    globalstatus = true,
                },
            })
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require("ibl").setup({
                indent = {
                    char = "│",
                },
                scope = {
                    enabled = true,
                    show_start = true,
                    show_end = true,
                },
                exclude = {
                    filetypes = {
                        "help",
                        "alpha",
                        "dashboard",
                        "NvimTree",
                        "lazy",
                        "mason",
                        "toggleterm",
                    },
                },
            })
        end
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons',
        },
        opts = {},
        ft = { "markdown" },
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bufferline").setup({
                options = {
                    diagnostics = "nvim_lsp",
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer",
                            highlight = "Directory",
                            text_align = "left",
                        }
                    },
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                }
            })
        end
    },
}
