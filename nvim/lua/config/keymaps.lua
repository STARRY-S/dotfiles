-- Buffer navigation keymaps
vim.keymap.set('n', '<S-h>', ":bprevious<CR>", {})
vim.keymap.set('n', '<S-l>', ':bnext<CR>', {})
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', {})

-- Show diagnostic message in floating window
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = "Show diagnostics" })

-- Jump to previous diagnostic
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })

-- Jump to next diagnostic
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- Window navigation: Use Ctrl + hjkl to jump between splits instantly
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = "Move to left window" })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = "Move to lower window" })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = "Move to upper window" })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = "Move to right window" })

-- Insert mode arrow keys using Ctrl + hjkl
vim.keymap.set('i', '<C-h>', '<Left>', { desc = "Move left" })
vim.keymap.set('i', '<C-j>', '<Down>', { desc = "Move down" })
vim.keymap.set('i', '<C-k>', '<Up>', { desc = "Move up" })
vim.keymap.set('i', '<C-l>', '<Right>', { desc = "Move right" })

-- =========================================
-- Bufferline Management Keymaps
-- =========================================
-- Close all buffers except the current active one
vim.keymap.set('n', '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', { desc = "Close other buffers" })

-- Close all buffers to the right of the current one
vim.keymap.set('n', '<leader>br', '<Cmd>BufferLineCloseRight<CR>', { desc = "Close buffers to the right" })

-- Close all buffers to the left of the current one
vim.keymap.set('n', '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', { desc = "Close buffers to the left" })

-- Trigger visual pick mode to select a buffer to close
vim.keymap.set('n', '<leader>bp', '<Cmd>BufferLinePickClose<CR>', { desc = "Pick buffer to close" })

