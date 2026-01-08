return {
  'github/copilot.vim',
  event = 'VeryLazy',
  config = function()
    -- Optional: configure keybindings or settings here
    vim.g.copilot_no_tab_map = true -- Disable default Tab mapping if needed
    -- Map <Tab> to accept the suggestion
    vim.api.nvim_set_keymap('i', '<Tab>', 'copilot#Accept("<CR>")', { silent = true, expr = true })
  end,
}

