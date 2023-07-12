-- local jobid    = nil
-- local Terminal = require('bufterm.terminal').Terminal
-- local ui       = require('bufterm.ui')
-- local win      = nil;
-- local winid    = nil;
--
-- local auto_run = function()
--     local current_win = vim.api.nvim_get_current_win()
--
--     local runner = Terminal:new({
--         cmd = function()
--             local runner_map = {
--                 go   = 'go run .',
--                 rust = 'cargo run'
--             }
--             local cmd = runner_map[vim.bo.filetype]
--
--             if not cmd then
--                 -- fallback to default shell if can't run current filetype
--                 return vim.o.shell
--             end
--             return cmd
--         end,
--         termlisted = true,
--         fallback_on_exit = false,
--         auto_close = true,
--     })
--     if jobid == nil then
--         runner:spawn()
--         -- set jobid
--         jobid = runner.jobid
--     else
--         vim.fn.jobstop(jobid)
--         runner:spawn()
--         jobid = runner.jobid
--     end
--
--
--     if win == nil or winid == nil or not vim.api.nvim_win_is_valid(winid) then
--         win   = ui.Window:new();
--
--         -- resize the window size
--         winid = win:open(runner.bufnr)
--     end
--
--     local self_ui = vim.api.nvim_list_uis()[1]
--     local width   = self_ui.width
--     local height  = math.floor(20)
--     vim.api.nvim_win_set_width(winid, width)
--     vim.api.nvim_win_set_height(winid, height)
--
--     if runner.cmd() ~= vim.o.shell then
--         vim.api.nvim_set_current_win(current_win)
--     end
--
--     runner:enter(winid)
-- end
--

local Terminal   = require('toggleterm.terminal').Terminal
local runner_map = {
    rust = "cargo run",
    go = "go run ."
}

function Run()
    local current_win = vim.api.nvim_get_current_win()
    local filetype    = vim.bo.filetype
    local cmd         = runner_map[filetype]

    if not cmd then
        print("Can't run current filetype")
        return
    end
    local runner = Terminal:new({
        cmd = cmd,
        hidden = true,
        auto_scroll = true,
        close_on_exit = false,
        on_open = function(term)
            -- vim.cmd('stopinsert')
            -- vim.api.nvim_feedkeys("<cmd>", "n", false)
            -- vim.cmd("<>startinsert!")
        end
    })


    runner:toggle()
    -- vim.api.nvim_set_current_win(current_win)
end

vim.api.nvim_create_user_command("Run", function()
    Run()
end, {})


vim.keymap.set("n", "R", Run, {})
