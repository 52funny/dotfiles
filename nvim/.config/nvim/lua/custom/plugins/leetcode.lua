return {
  'kawre/leetcode.nvim',
  -- `nvim-treesitter`'s main branch only updates parsers that are already
  -- installed, so use TSInstall to bootstrap the optional HTML parser.
  build = ':TSInstall html',
  dependencies = {
    -- This also ensures that TSInstall is available when Lazy builds this
    -- plugin during a fresh Neovim installation.
    'nvim-treesitter/nvim-treesitter',
    -- include a picker of your choice, see picker section for more details
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    -- configuration goes here
    cn = {
      enabled = true,
      translator = false,
    },
  },
}
