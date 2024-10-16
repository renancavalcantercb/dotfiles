vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-i>", 'copilot#Accept("<CR>")', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap("n", "<C-c>", "ggVGy", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "n",
  "<leader>vs",
  ":VenvSelect<CR>",
  { noremap = true, silent = true, desc = "Select VirtualEnv" }
)
