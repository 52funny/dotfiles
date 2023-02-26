return function(use)
  -- vim-surround
  use 'tpope/vim-surround'

  -- wildfire
  use 'gcmt/wildfire.vim'

  -- layzgit
  use 'kdheepak/lazygit.nvim'


  -- for input method
  use 'laishulu/vim-macos-ime'

  -- autopairs
  use({
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end
  })

  -- nvim-tree
  use({
    'nvim-tree/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
  })

  use { 'catppuccin/nvim', as = 'catppuccin' }

  -- floaterm
  use 'numToStr/FTerm.nvim'

  -- SimpyFold
  use({
    'anuvyklack/pretty-fold.nvim',
    config = function()
      require('pretty-fold').setup({})
    end
  })






  local function setup()
    -- lazygit
    vim.keymap.set('n', '<leader>lg', ':LazyGit<cr>')

    -- vim-macos-ime
    --
    vim.g.macosime_cjk_ime = 'com.apple.inputmethod.SCIM.ITABC'
    vim.g.macosime_normal_ime = 'com.apple.keylayout.ABC'



    -- nvim-tree
    --
    vim.keymap.set('n', 'tt', ':NvimTreeToggle<CR>')
    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      view = {
        adaptive_size = true,
        mappings = {
          list = {
            { key = "u", action = "dir_up" },
          },
        },
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    })

    -- colorscheme
    --
    require('catppuccin').setup({
      flavour = "macchiato"
    })

    vim.cmd [[colorscheme catppuccin]]


    -- FTerm
    --
    require 'FTerm'.setup({
      border     = 'single',
      dimensions = {
        height = 0.7,
        width = 0.7,
      },
    })

    -- Example keybindings
    vim.keymap.set('n', '<C-`>', '<CMD>lua require("FTerm").toggle()<CR>')
    vim.keymap.set('t', '<C-`>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')



  end

  setup()


end
