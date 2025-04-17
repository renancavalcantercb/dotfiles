vim.g.copilot_no_tab_map = true

vim.api.nvim_set_keymap("i", "<C-i>", 'copilot#Accept("<CR>")', { noremap = true, silent = true, expr = true })

-- Save the file, copy the entire buffer to the clipboard, and move the cursor back.
vim.api.nvim_set_keymap(
  "n",
  "<C-c>",
  ":w<CR> :let @+ = join(getbufline('%', 1, '$'), \"\\n\")<CR>h",
  { noremap = true, silent = true }
)

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

vim.api.nvim_create_user_command("Py", function()
  local file = vim.fn.expand("%:p")
  if file:match("%.py$") then
    vim.cmd("!python " .. file)
  else
    print("Not a python file")
  end
end, { nargs = 0 })
