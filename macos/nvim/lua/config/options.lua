-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.cmd("language en_US")

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = "utf-8,latin1"

vim.opt.relativenumber = false

vim.g.python3_host_prog = "/opt/homebrew/Cellar/python@3.11/3.11.9_1/bin/python3.11"
vim.env.PYTHONPATH = "/opt/homebrew/lib/python3.11/site-packages"

vim.opt.completeopt = { "menu", "noselect" }
