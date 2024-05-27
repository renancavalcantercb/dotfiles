lvim.leader = ","
require('user.commands').setup()
require('user.keys').setup()
require('user.plugins')

-- Configuração do tema gruvbox
vim.opt.background = "dark" -- ou "light" dependendo da sua preferência
vim.g.gruvbox_contrast_dark = "hard"

vim.defer_fn(function()
  vim.cmd("colorscheme gruvbox")
end, 100)

