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
local luasnip = require "luasnip"
cmp.mapping.confirm({ select = true })
cmp.setup {
    completion = {
        completeopt = 'menu,menuone,noinsert'
    }
}

-- neovim cmp border settings
--
local kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = ""
}


-- cmp.setup {
--     view = {
--         entries = "custom"
--     },
--     window = {
--         completion = cmp.config.window.bordered(),
--         documentation = cmp.config.window.bordered(),
--     },
--
--
--     snippet = {
--         expand = function(args)
--             luasnip.lsp_expand(args.body)
--         end,
--     },
--
--     formatting = {
--         format = function(entry, vim_item)
--             local prsnt, lspkind = pcall(require, "lspkind")
--             if not prsnt then
--                 -- From kind_icons array
--                 vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
--             else
--                 -- From lspkind
--                 return lspkind.cmp_format()
--             end
--             -- Source
--             vim_item.menu = ({
--                 buffer = "[Buffer]",
--                 nvim_lsp = "[LSP]",
--                 luasnip = "[LuaSnip]",
--                 nvim_lua = "[Lua]",
--                 latex_symbols = "[LaTeX]",
--             })[entry.source.name]
--
--             return vim_item
--         end
--     },
--
--     mapping = cmp.mapping.preset.insert {
--         ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--         ['<C-f>'] = cmp.mapping.scroll_docs(4),
--         ['<C-Space>'] = cmp.mapping.complete {},
--         ['<CR>'] = cmp.mapping.confirm {
--             behavior = cmp.ConfirmBehavior.Replace,
--             select = true,
--         },
--         ['<Tab>'] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--                 cmp.select_next_item()
--             elseif luasnip.expand_or_jumpable() then
--                 luasnip.expand_or_jump()
--             else
--                 fallback()
--             end
--         end, { 'i', 's' }),
--         ['<S-Tab>'] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--                 cmp.select_prev_item()
--             elseif luasnip.jumpable(-1) then
--                 luasnip.jump(-1)
--             else
--                 fallback()
--             end
--         end, { 'i', 's' }),
--     },
--     sources = {
--         { name = 'nvim_lsp' },
--         { name = 'luasnip' },
--     },
-- }
--
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
--
