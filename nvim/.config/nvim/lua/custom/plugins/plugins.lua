return {
  { 'tpope/vim-surround' },

  -- wildfire
  { 'gcmt/wildfire.vim' },

  -- layzgit
  { 'kdheepak/lazygit.nvim' },


  -- for input method
  { 'laishulu/vim-macos-ime' },

  -- autopairs
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end
  },

  -- nvim-tree
  {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
  },

  { 'catppuccin/nvim',    as = 'catppuccin' },

  -- floaterm
  { 'numToStr/FTerm.nvim' },

  -- SimpyFold
  {
    'anuvyklack/pretty-fold.nvim',
    config = function()
      require('pretty-fold').setup({})
    end
  }
}
