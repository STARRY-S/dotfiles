return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local function sort_by_number(nodes)
                table.sort(nodes, function(a, b)
                    if a.type ~= b.type then
                        if a.type == "directory" then
                            return true
                        elseif b.type == "directory" then
                            return false
                        end
                    end

                    local num_a = tonumber(string.match(a.name, "^%d+"))
                    local num_b = tonumber(string.match(b.name, "^%d+"))

                    if num_a and num_b then
                        if num_a ~= num_b then
                            return num_a < num_b
                        end
                    end

                    return a.name < b.name
                end)
            end
            require("nvim-tree").setup({
                view = { width = 30 },
                renderer = { group_empty = true },
                sort = {
                      sorter = sort_by_number,
                },
                -- Automatically locate and focus the currently open file in the tree
                update_focused_file = {
                    enable = true,
                },

                -- Let nvim-tree watch for external file changes and auto-refresh
                filesystem_watchers = {
                    enable = true,
                    debounce_delay = 50,
                },
            })
        end,
        keys = {
            { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Explorer" },
            { "<leader>o", "<cmd>NvimTreeFocus<cr>", desc = "Focus Explorer" },
        }
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
        }
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                direction = "float",
                -- direction = "horizontal",
                -- size = 30,
                float_opts = {
                    --  border = 'single' | 'double' | 'shadow' | 'curved'
                    border = "curved",
                },
            })
        end,
        keys = {
            { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" }
        }
    },
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("gitsigns").setup({
                current_line_blame = true,
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = "eol",
                    delay = 500,
                },
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    map("n", "]c", function()
                        if vim.wo.diff then return "]c" end
                        vim.schedule(function() gs.next_hunk() end)
                        return "<Ignore>"
                    end, { expr = true, desc = "Jump to next git hunk" })

                    map("n", "[c", function()
                        if vim.wo.diff then return "[c" end
                        vim.schedule(function() gs.prev_hunk() end)
                        return "<Ignore>"
                    end, { expr = true, desc = "Jump to previous git hunk" })

                    map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview git hunk" })
                    map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset git hunk" })
                end
            })
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function()
            local wk = require("which-key")
            wk.setup({})
            wk.add({
                { "<leader>f", group = "Find/File" },
                { "<leader>h", group = "Git Hunk" },
                { "<leader>c", group = "Code/LSP" },
                { "<leader>t", group = "Toggle Tools" },
            })
        end
    },
}
