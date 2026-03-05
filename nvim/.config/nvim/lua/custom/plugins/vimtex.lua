return {
  'lervag/vimtex',
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    -- For MacOS Skim viewer
    if vim.fn.has 'mac' == 1 then
      vim.g.vimtex_view_method = 'sioyek'
    end
    -- Disable syntax highlighting (we use Treesitter)
    vim.g.vimtex_syntax_enabled = 0
  end,
  ft = { 'tex', 'bib' },
}
