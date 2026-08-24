vim.opt.colorcolumn = "80,120"
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.colorcolumn = "50,72"
    end,
})

local function set_whitespace_highlights()
    vim.api.nvim_set_hl(0, "TrailingWhitespace", { bg = "#753e3e" })
    vim.api.nvim_set_hl(0, "LiteralTabError", { bg = "#753e3e" })
end

set_whitespace_highlights()
vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("WhitespaceHighlights", { clear = true }),
    callback = set_whitespace_highlights,
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = [[
        syntax clear TrailingWhitespace |
        syntax match TrailingWhitespace "\s\+$"
    ]],
})

local preserve_trailing_whitespace = {
    csv = true,
    diff = true,
    mail = true,
    markdown = true,
    pandoc = true,
    quarto = true,
    rmd = true,
    text = true,
    tsv = true,
}

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = "*",
    callback = function()
        if vim.bo.buftype ~= "" or preserve_trailing_whitespace[vim.bo.filetype] then
            return
        end

        local save_view = vim.fn.winsaveview()
        vim.cmd([[ %s/\s\+$//e ]])
        vim.fn.winrestview(save_view)
    end,
})

-- =============================================
-- Configure indentation rules for Lua files
-- Enforce spaces and highlight literal tabs as errors
-- =============================================
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "sh", "zsh", "markdown", "python", "javascript", "html", "lua" },
    callback = function()
        -- Use spaces instead of literal tabs
        vim.opt_local.expandtab = true
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4

        vim.cmd([[syntax match LiteralTabError /\t/]])
    end,
})

-- =============================================
-- Configure strict tab indentation for Go files
-- Ensure expandtab is strictly disabled
-- =============================================
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "go", "gomod", "makefile" },
    callback = function()
        -- Use literal tabs instead of spaces
        vim.opt_local.expandtab = false
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
    end,
})
