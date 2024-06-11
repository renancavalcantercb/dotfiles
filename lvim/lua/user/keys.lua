local M = {}

function M.setup()
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

end

return M
