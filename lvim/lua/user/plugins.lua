local M = {}

table.insert(lvim.plugins, {"wakatime/vim-wakatime"})
table.insert(lvim.plugins, { "github/copilot.vim" })
table.insert(lvim.plugins, {
  "ellisonleao/gruvbox.nvim",
  dependencies = { "rktjmp/lush.nvim" },
})

return M

