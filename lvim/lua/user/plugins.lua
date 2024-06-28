local M = {}

table.insert(lvim.plugins, {"wakatime/vim-wakatime"})
table.insert(lvim.plugins, { "github/copilot.vim" })
table.insert(lvim.plugins, {
  "ellisonleao/gruvbox.nvim",
  dependencies = { "rktjmp/lush.nvim" },
})
table.insert(lvim.plugins, {
  "stevearc/dressing.nvim",
})
table.insert(lvim.plugins, {
  "folke/trouble.nvim", depedencies = "kyazdani42/nvim-web-devicons"
})
return M

