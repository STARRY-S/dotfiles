-- Set http_proxy if needed
local proxy = ""
vim.env.http_proxy = proxy
vim.env.https_proxy = proxy
vim.env.all_proxy = proxy
vim.env.no_proxy = "127.0.0.1,localhost,::1,.cn,.local,.lan,.hxstarrys.me"
