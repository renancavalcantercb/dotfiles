local M = {}

function M.setup()
    vim.api.nvim_create_user_command('RunPythonBuffer', function()
        vim.cmd('write')  -- Salva o buffer atual
        vim.cmd('!python3 %')  -- Executa o script Python no buffer atual
    end, {desc = "Execute Python script in current buffer"})

    vim.api.nvim_create_user_command('PasteLooqCode', function()
        local lines = {
            'import looqbox as lq',
            'from datetime import date, datetime',
            'from looqbox import CssOption as css',
            '',
            'cf = lq.library("client_functions.py")',
            '',
            'def looq_response(par):',
            '    date_list = lq.get_entity(',
            '        "$date",',
            '        par,',
            '        [',
            '            [',
            '                datetime.strftime(date.today().replace(day=1), "%Y-%m-%d"),',
            '                datetime.strftime(date.today(), "%Y-%m-%d"),',
            '            ]',
            '        ],',
            '        only_value=True,',
            '    )',
            '',
            'lq.looq_test_question(looq_response, {})',
        }
        local current_buf = vim.api.nvim_get_current_buf()
        local line_count = vim.api.nvim_buf_line_count(current_buf)
        vim.api.nvim_buf_set_lines(current_buf, line_count, line_count, false, lines)
    end, {desc = 'Paste Looqbox code snippet'})

    vim.api.nvim_create_user_command('CloseTabOrBuffer', function()
        if #vim.api.nvim_list_tabpages() > 1 then
            vim.cmd('tabclose')  -- Fecha a aba se houver mais de uma aba aberta
        else
            vim.cmd('bd')  -- Fecha o buffer se esta for a última aba
        end
    end, {desc = "Close tab or buffer if it's the last tab"})
end

M.setup()

return M
