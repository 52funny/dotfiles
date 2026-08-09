return {
  'lervag/vimtex',
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- Build directory
    vim.g.vimtex_compiler_latexmk = {
      out_dir = 'build',
      aux_dir = 'build',
    }
    -- VimTeX configuration goes here, e.g.
    -- For MacOS Skim viewer
    if vim.fn.has 'mac' == 1 then
      vim.g.vimtex_view_method = 'sioyek'
    elseif vim.fn.has 'linux' then
      vim.g.vimtex_view_method = 'zathura'
    end

    -- Disable syntax highlighting (we use Treesitter)
    vim.g.vimtex_syntax_enabled = 0

    vim.g.vimtex_format_enabled = 0

    -- 编译成功时不在底部显示编译成功的消息
    vim.g.vimtex_compiler_silent = 1

    -- 关闭 Quickfix 窗口在出现 warning 时自动弹开（只在 error 时弹出）
    vim.g.vimtex_quickfix_open_on_warning = 0
  end,
  ft = { 'tex', 'bib' },
}
