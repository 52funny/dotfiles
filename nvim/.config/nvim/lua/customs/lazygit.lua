local Terminal = require("toggleterm.terminal").Terminal
-- local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
--
-- function lazygit_toggle()
--     lazygit:toggle()
-- end
--
-- vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua lazygit_toggle()<CR>", { noremap = true, silent = true })

local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    -- float_opts = {
    --     border = "double",
    -- },
    -- function to run on opening the terminal
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        -- if vim.fn.mapcheck("<esc>", "t") ~= "" then
        --     vim.api.nvim_buf_del_keymap(term.bufnr, "n", "<esc>")
        -- end
    end,
    -- function to run on closing the terminal
    on_close = function(_)
        vim.cmd("startinsert!")
    end,
})

function _lazygit_toggle()
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
