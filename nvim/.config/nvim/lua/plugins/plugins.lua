return {
    { 'tpope/vim-surround' },

    -- wildfire
    { 'gcmt/wildfire.vim' },

    -- layzgit
    -- { 'kdheepak/lazygit.nvim' },


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
    },

    -- { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
    {
        "iamcco/markdown-preview.nvim",
        ft = { "markdown", },
        build = "yarn install",
        config = function()
            vim.g.instant_markdown_autostart = 0
        end
    },
    -- force terminal color same to nvim
    -- { "typicode/bg.nvim", lazy = false },

    -- {
    --     "ellisonleao/gruvbox.nvim",
    --     priority = 1000,
    --     config = function()
    --         require("gruvbox").setup({
    --             italic = {
    --                 strings = false,
    --                 comments = false,
    --                 operators = false,
    --                 folds = false,
    --             },
    --             -- fix Sign color problem
    --             -- refer https://github.com/ellisonleao/gruvbox.nvim/issues/230
    --             overrides = {
    --                 SignColumn = { link = "Normal" },
    --                 GruvboxGreenSign = { bg = "" },
    --                 GruvboxOrangeSign = { bg = "" },
    --                 GruvboxPurpleSign = { bg = "" },
    --                 GruvboxYellowSign = { bg = "" },
    --                 GruvboxRedSign = { bg = "" },
    --                 GruvboxBlueSign = { bg = "" },
    --                 GruvboxAquaSign = { bg = "" },
    --             },
    --         })
    --         vim.cmd([[colorscheme gruvbox]])
    --         -- vim.cmd([[set background=light]])
    --         -- vim.cmd([[set background=dark]])
    --     end
    -- },
    --
    -- {
    --     "bluz71/vim-moonfly-colors",
    --     name = "moonfly",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         vim.cmd([[colorscheme moonfly]])
    --     end
    -- },
    --
    -- {
    --     "morhetz/gruvbox",
    --     name = "gruvbox",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         vim.cmd([[colorscheme gruvbox]])
    --     end
    -- },
    -- {
    --     'sainnhe/gruvbox-material',
    --     -- name = "seoul256",
    --     lazy = false,
    --     priority = 1000,
    --
    --     dependencies = {
    --         "rktjmp/lush.nvim",
    --     },
    --     config = function()
    --         vim.cmd([[colorscheme gruvbox-material]])
    --     end
    -- },



    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup {
                -- size can be a number or function which is passed the current terminal
                size = 20,
                open_mapping = [[<c-\>]],
                hide_numbers = true, -- hide the number column in toggleterm buffers
                shade_filetypes = {},
                shade_terminals = false,
                start_in_insert = true,
                insert_mappings = true, -- whether or not the open mapping applies in insert mode
                persist_size = true,
                direction = 'horizontal',
                -- close_on_exit = true, -- close the terminal window when the process exits
                shell = vim.o.shell, -- change the default shell
            }
        end
    },
    -- {
    --     "lvimuser/lsp-inlayhints.nvim",
    --     config = function()
    --         require("lsp-inlayhints").setup {
    --             -- highlight = "Comment",
    --             -- prefix = " » ",
    --             -- aligned = false,
    --             -- only_current_line = false,
    --             -- enabled = { "ChainingHint", "TypeHint", "ParameterHint" },
    --         }
    --         vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
    --         vim.api.nvim_create_autocmd("LspAttach", {
    --             group = "LspAttach_inlayhints",
    --             callback = function(args)
    --                 if not (args.data and args.data.client_id) then
    --                     return
    --                 end
    --
    --                 local bufnr = args.buf
    --                 local client = vim.lsp.get_client_by_id(args.data.client_id)
    --                 local inlayhints = require("lsp-inlayhints");
    --                 -- inlayhints.setup()
    --                 inlayhints.on_attach(client, bufnr)
    --             end,
    --         })
    --     end
    -- }
}
