-- neovim completion max length
vim.opt.pumheight = 25
vim.opt.foldmethod = "expr"
vim.opt.foldlevel = 99
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.undofile = true
vim.opt.scrolloff = 10
vim.opt.termguicolors = true


-- set just one statusline
vim.o.laststatus = 3



-- macosime
vim.g.macosime_cjk_ime = 'com.apple.inputmethod.SCIM.ITABC'
vim.g.macosime_normal_ime = 'com.apple.keylayout.ABC'

-- nvim-tree setup
vim.keymap.set('n', 'tt', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})


-- FTerm
--
-- require 'FTerm'.setup({
--     border     = 'single',
--     dimensions = {
--         height = 0.7,
--         width = 0.7,
--     },
-- })
--
-- -- Example keybindings
-- vim.keymap.set('n', '<C-\\>', '<CMD>lua require("FTerm").toggle()<CR>')
-- vim.keymap.set('t', '<C-\\>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
