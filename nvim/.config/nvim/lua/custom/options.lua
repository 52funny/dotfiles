-- neovim completion max length
vim.opt.pumheight = 25

vim.opt.foldmethod = "expr"
vim.opt.foldlevel = 99
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"


-- macosime
vim.g.macosime_cjk_ime = 'com.apple.inputmethod.SCIM.ITABC'
vim.g.macosime_normal_ime = 'com.apple.keylayout.ABC'

-- nvim-tree setup
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


local cmp = require "cmp"
cmp.mapping.confirm({ select = true })
cmp.setup {
    completion = {
        completeopt = 'menu,menuone,noinsert'
    }
}
