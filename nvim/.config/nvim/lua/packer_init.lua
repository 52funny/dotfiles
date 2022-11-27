local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
    download_result = fn.system({ 'ls', '-l', install_path })
    print("auto install packer result: " .. download_result)
end

vim.cmd [[packadd packer.nvim]] -- packadd packer module

--return require('packer').startup(function(use)
--
--  -- Automatically set up your configuration after cloning packer.nvim
--  -- Put this at the end after all plugins
--  if packer_bootstrap then
--    require('packer').sync()
--  end
--end)

return require('packer').startup(function(use)
    -- manager self
    use 'wbthomason/packer.nvim'

    use 'tpope/vim-surround'
    use 'vim-airline/vim-airline'
    use 'gcmt/wildfire.vim'

    use 'kdheepak/lazygit.nvim'
    use 'laishulu/vim-macos-ime'

    use 'tpope/vim-commentary'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
    }
    -- Autopair
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup {}
        end
    }

    -- Indent line
    use 'lukas-reineke/indent-blankline.nvim'

    -- Treesitter interface
    use 'nvim-treesitter/nvim-treesitter'

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- Lsp Formatting
    use 'lukas-reineke/lsp-format.nvim'

    -- Formatting
    -- use 'sbdchd/neoformat'


    -- Color schemes
    use 'navarasu/onedark.nvim'



    -- Autocomplete
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip'
        },
        use 'hrsh7th/cmp-vsnip',
        use 'hrsh7th/vim-vsnip',
        use 'rafamadriz/friendly-snippets',
        use 'onsails/lspkind.nvim',
    }
    use 'simrat39/rust-tools.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
end)
