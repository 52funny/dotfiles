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
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end
  },

  -- nvim-tree
  {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
  },

  -- floaterm
  { 'numToStr/FTerm.nvim' },

  -- SimpyFold
  {
    'anuvyklack/pretty-fold.nvim',
    config = function()
      require('pretty-fold').setup({})
    end
  },
  -- rust-tools
  {
    "simrat39/rust-tools.nvim"
  },
  -- colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    integrations = {
      gitsigns = true,
    },
    config = function()
      require('catppuccin').setup({
        flavour = "mocha",
        background = {
          light = "latte",
          dark = "mocha",
        },
        no_italic = true,
      })
      vim.cmd('colorscheme catppuccin')
    end
  },
  -- force terminal color same to nvim
  { "typicode/bg.nvim",   lazy = false },

  -- github copilot
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end
  },
  -- nvim-dap
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "theHamsta/nvim-dap-virtual-text",
    }
  }
}
