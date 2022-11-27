-- vim.opt.nocompatible = true
-- vim.opt.filetype = true

local opt = vim.opt
local g = vim.g

opt.mouse = 'a'

-- editor
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
-- vim.opt.list = true
-- vim.opt.listchars = { trail = '▫' }
opt.foldmethod = 'syntax'
opt.foldlevel = 99
opt.foldenable = true

-- main
opt.number = true
opt.wildmenu = true
opt.wrap = true
opt.showcmd = true
opt.hlsearch = true
opt.smartcase = true
opt.ignorecase = true


opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.smartindent = true -- Autoindent new lines



g.macosime_cjk_ime = 'com.apple.inputmethod.SCIM.ITABC'
g.macosime_normal_ime = 'com.apple.keylayout.ABC'


-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
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
