vim.g.copilot_no_tab_map = true

vim.api.nvim_set_keymap("i", "<C-i>", 'copilot#Accept("<CR>")', { noremap = true, silent = true, expr = true })

vim.api.nvim_set_keymap("n", "<C-c>", "ggVGy", { noremap = true, silent = true })

vim.api.nvim_set_keymap(
  "n",
  "<leader>vs",
  ":VenvSelect<CR>",
  { noremap = true, silent = true, desc = "Select VirtualEnv" }
)

-- allow use of `d` to delete without yanking
vim.api.nvim_set_keymap("n", "d", "_d", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true, silent = true })

-- allow use of `c` to change without yanking
vim.api.nvim_set_keymap("n", "c", '"_c', { noremap = true, silent = true })

-- invert the behavior of `i` and `a` in normal mode
vim.api.nvim_set_keymap("n", "i", "a", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "a", "i", { noremap = true, silent = true })
