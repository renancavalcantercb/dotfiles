require("lazyvim.plugins.extras.lsp.none-ls")

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
  {
    dir = "/Users/renan-dev/Desktop/estudos/cli/db-cli-nvim",
    config = function()
      vim.api.nvim_create_user_command("DBQuery", function(opts)
        require("dbcli").run_query(opts.args)
      end, { nargs = 1 })
    end,
  },
  -- todo.nvim local plugin test
  -- {
  --   dir = "/Users/renan-dev/Desktop/estudos/lua/todo.nvim",
  --   event = { "BufReadPre", "BufNewFile" }, -- Use eventos separados
  --   config = function()
  --     require("todo").setup()
  --   end,
  -- },
  {
    "renancavalcantercb/todo.nvim",
    config = function()
      require("todo").setup()
    end,
  },
}
