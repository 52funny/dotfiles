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
require 'FTerm'.setup({
    border     = 'single',
    dimensions = {
        height = 0.7,
        width = 0.7,
    },
})

-- Example keybindings
vim.keymap.set('n', '<C-\\>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<C-\\>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')



-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

luasnip.config.setup {}

local kind_icons = {
    Text = "",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = "󰇽",
    Variable = "󰂡",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "󰅲",
}

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup {
    view = {
        entries = { name = "custom", selection_order = "top_down" }
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered({
            zindex = 900,
            max_height = 0,
            max_width = 0,
            scrollbar = false,
        }),
    },
    -- completion = {
    --     preselect = 'none',
    --     completeopt = "menuone",
    -- },

    sorting = {
        comparators = {
            cmp.config.compare.exact,
            cmp.config.compare.length,
            -- cmp.config.compare.exact,
            -- cmp.config.compare.offset,
            -- cmp.config.compare.kind,
        }
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = function(fallback)
            if not cmp.select_next_item() then
                if vim.bo.buftype ~= 'prompt' and has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end
        end,

        ['<S-Tab>'] = function(fallback)
            if not cmp.select_prev_item() then
                if vim.bo.buftype ~= 'prompt' and has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end
        end,
    },
    sources = {
        { name = "copilot" },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
--
local _border = "single"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = _border
    }
)


vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
        border = _border
    })

vim.diagnostic.config {
    float = { border = _border }
}
