return {
  {
    "wakatime/vim-wakatime",
  },
  {
    "github/copilot.vim",
  },
  -- Add `pyright` to mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "pyright", "black" })
    end,
  },

  -- Setup null-ls with `black`
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      vim.list_extend(opts.sources, { nls.builtins.formatting.black })
    end,
  },
}
