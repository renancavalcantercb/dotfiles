lvim.leader = ","
require('user.commands').setup()
require('user.keys').setup()
require('user.plugins')

-- Treesitter
lvim.builtin.treesitter.ensure_installed = {
  "python",
}

-- Formatters
local formatters = require('lvim.lsp.null-ls.formatters')
formatters.setup({
  {
    command = "black",
    filetypes = { "python" },
  },
})

-- Linter
local linters = require('lvim.lsp.null-ls.linters')
linters.setup({
  {
    command = "flake8",
    args = {"--ignore=E203"},
    filetypes = { "python" },
  },
})

local lspconfig = require('lspconfig')
lspconfig.pyright.setup {
  settings = {
    python = {
      pythonPath = "/opt/homebrew/bin/python3.11",
    },
  },
}

-- Remover trailing whitespace ao salvar
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.trim_whitespace.with({
      filetypes = { "python" }, -- Adicione outros filetypes se necessário
    }),
  },
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
    end
  end,
})


vim.cmd [[autocmd BufWritePre *.py lua vim.lsp.buf.format { async = false }]]

vim.opt.background = "dark"
vim.defer_fn(function()
  vim.cmd("colorscheme gotham256")
end, 100)

