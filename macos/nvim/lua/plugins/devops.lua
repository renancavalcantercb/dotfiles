return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "hadolint",
        "shellcheck",
        "shfmt",
        "tflint",
        "yamllint",
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "hcl",
        "terraform",
        "dockerfile",
        "helm",
        "yaml",
        "json",
        "jsonnet",
      })
    end,
  },
}
