return {
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000,
        config = function()
            local light_blue = "#5cc9ff"
            require("onedarkpro").setup({
                styles = {
                    comments = "italic",
                    functions = "bold",
                },
                colors = {
                    -- adjust purple color
                    -- purple = "#85a3ff",
                },
                highlights = {
                    LiteralTabError = { bg = "#753e3e" },
                    NvimTreeFolderIcon = { fg = light_blue },
                    NvimTreeFolderName = { fg = light_blue },
                    NvimTreeRootFolder = { fg = light_blue },
                    NvimTreeOpenedFolderName = { fg = light_blue },
                    NvimTreeCursorLine = { bg = "#2c323c" },
                    TermCursor = { fg = "NONE", bg = "#aaaaaa" },
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
