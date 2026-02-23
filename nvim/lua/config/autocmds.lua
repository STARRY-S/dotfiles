vim.opt.colorcolumn = "80,120"
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.colorcolumn = "50,72"
    end,
})

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

-- =============================================
-- Configure indentation rules for Lua files
-- Enforce spaces and highlight literal tabs as errors
-- =============================================
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "sh", "zshrc", "md", "py", "js", "html", "lua" },
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
