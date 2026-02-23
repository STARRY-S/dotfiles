vim.opt.colorcolumn = "80,120"
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.colorcolumn = "50,72"
    end,
})
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#232323" })

vim.api.nvim_set_hl(0, 'TrailingWhitespace', { bg='#753e3e' })
vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*',
    command = [[
        syntax clear TrailingWhitespace |
        syntax match TrailingWhitespace "\_s\+$"
    ]]}
)

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = "*",
    callback = function()
        if vim.bo.filetype == "markdown" then
            return
        end

        local save_view = vim.fn.winsaveview()
        vim.cmd([[ %s/\s\+$//e ]])
        vim.fn.winrestview(save_view)
    end,
})

-- =========================================
-- Custom Highlight for Listchars (Tabs & Spaces)
-- =========================================
local function set_listchar_colors()
    local invisible_char_color = "#333333"
    -- 'Whitespace' controls tab, space, lead, and trail characters
    vim.api.nvim_set_hl(0, "Whitespace", { fg = invisible_char_color })
    -- 'NonText' controls eol, extends, and precedes characters
    -- vim.api.nvim_set_hl(0, "NonText", { fg = invisible_char_color })
    -- 'SpecialKey' is sometimes used as a fallback by certain themes
    vim.api.nvim_set_hl(0, "SpecialKey", { fg = invisible_char_color })
end

-- Execute immediately on startup (fixes the lazy.nvim race condition)
-- set_listchar_colors()

-- Bind to ColorScheme event (in case you change themes dynamically later)
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = set_listchar_colors,
})

-- =============================================
-- Configure indentation rules for Lua files
-- Enforce spaces and highlight literal tabs as errors
-- =============================================
vim.api.nvim_create_autocmd("FileType", {
    pattern = "lua",
    callback = function()
        -- Use spaces instead of literal tabs
        vim.opt_local.expandtab = true
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4

        -- Highlight literal tab characters with red background
        vim.fn.matchadd("ErrorMsg", "\\t")
    end,
})

-- =============================================
-- Configure strict tab indentation for Go files
-- Ensure expandtab is strictly disabled
-- =============================================
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "go", "gomod" },
    callback = function()
        -- Use literal tabs instead of spaces
        vim.opt_local.expandtab = false
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
    end,
})
