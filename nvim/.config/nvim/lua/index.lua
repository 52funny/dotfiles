require('options')
require('keymap')
require('nvim-cmp')
require('autorun')
require('autocmd')
require('debug')

-- for lazygit
require('customs.lazygit')



-- lsp no underline
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--     vim.lsp.diagnostic.on_publish_diagnostics, {
--         underline = false,
--         -- virtual_text = {
--         --     spacing = 4,
--         --     prefix = "",
--         -- },
--         -- signs = true,
--         -- update_in_insert = false,
--     }
-- )


local output_bufnr     = nil
local output_winid     = nil

local attach_to_buffer = function(command)
    local current_win = vim.api.nvim_get_current_win()
    local current_buf = vim.api.nvim_get_current_buf()

    -- create buf
    if output_bufnr == nil or vim.api.nvim_buf_is_valid(output_bufnr) == false then
        output_bufnr = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_name(output_bufnr, "AutoRun")
    end

    local ui = vim.api.nvim_list_uis()[1]
    vim.o.splitbelow = true

    -- create windows
    if output_winid == nil or vim.api.nvim_win_is_valid(output_winid) == false then
        local height = ui.height / 4
        vim.cmd(tostring(height) .. "new")
        output_winid = vim.api.nvim_get_current_win()
    end

    local append_data = function(_, data)
        if data then
            vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, false, data)
        end
    end

    local pid = nil
    local start_job = function()
        if pid ~= nil then
            vim.fn.jobstop(pid)
        end
        pid = vim.fn.jobstart({ "cargo", "run" }, {
            stdout_buffered = true,
            on_stdout = append_data,
            on_stderr = append_data,
        })
    end


    -- vim.api.nvim_create_autocmd("BufWritePost", {
    --     group = vim.api.nvim_create_augroup("AutoRun", { clear = true }),
    --     callback = start_job
    -- })

    vim.fn.termopen("cargo run", {
        on_exit = function(_, code)
            if code == 0 then
                vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, false, { "success" })
            else
                vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, false, { "failed" })
            end
        end,
        -- on_stdout = append_data,
        -- on_stderr = append_data,
    })

    -- vim.api.nvim_create_autocmd("BufWritePost", {
    --     group = vim.api.nvim_create_augroup("AutoRun", { clear = true }),
    --     callback = start_job
    -- })

    -- vim.api.nvim_win_set_buf(output_winid, output_bufnr)
    vim.api.nvim_set_current_win(current_win)


    -- print("in attach_to_buffer", output_bufnr)
end

-- vim.cmd("command! -nargs=0 Run lua vim.cmd.say_hello()")



local M = {}

M.setup = function(on_attach, capabilities)
    require("lsp").setup(on_attach, capabilities)
end

return M
