local M = {}

function M.setup()
    -- Mapeamentos de teclas existentes
    lvim.keys.normal_mode["<leader>py"] = ":RunPythonBuffer<CR>"
    lvim.keys.normal_mode["<leader>wq"] = ":CloseTabOrBuffer<CR>"
    lvim.keys.normal_mode["<leader>lo"] = ":PasteLooqCode<CR>"

    lvim.keys.normal_mode["<C-a>"] = "ggVG"
    lvim.keys.normal_mode["<C-c>"] = ":%y+<CR>"

    lvim.keys.normal_mode["<Tab>"] = ":bnext<CR>"
    lvim.keys.normal_mode["<S-Tab>"] = ":bprevious<CR>"

    lvim.keys.term_mode = {
        ["<Esc>"] = "<C-\\><C-n>",
    }

    lvim.builtin.which_key.mappings["t"] = {
        name = "+Terminal",
        f = { "<cmd>ToggleTerm<cr>", "Floating terminal" },
        v = { "<cmd>2ToggleTerm size=30 direction=vertical<cr>", "Split vertical" },
        h = { "<cmd>2ToggleTerm size=30 direction=horizontal<cr>", "Split horizontal" },
    }

    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap("i", "<C-i>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

    -- Mapeamentos de teclas para o Trouble.nvim
    vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", {silent = true, noremap = true})
    vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", {silent = true, noremap = true})
    vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", {silent = true, noremap = true})
    vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", {silent = true, noremap = true})
    vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", {silent = true, noremap = true})

    -- Mapeamentos de teclas para navegação de diagnósticos
    vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_next()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", {noremap = true, silent = true})

    -- Mapeamento de teclas para abrir diagnósticos com o Telescope
    vim.api.nvim_set_keymap("n", "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", {noremap = true, silent = true})
end

return M

