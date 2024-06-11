lvim.leader = ","
require('user.commands').setup()
require('user.keys').setup()
require('user.plugins')

lvim.builtin.treesitter.ensure_installed = {
  "python",
}

local formatters = require('lvim.lsp.null-ls.formatters')
formatters.setup({
  {
    exe = "black",
    filetypes = { "python" },
  },
})

local linters = require('lvim.lsp.null-ls.linters')
linters.setup({
  command= "flake8",
  args = {"--ignore=E203"},
  filetypes = { "python" },
})

vim.opt.background = "dark"

vim.defer_fn(function()
  vim.cmd("colorscheme gotham256")
end, 100)

