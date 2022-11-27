-----------------------------------------------------------
-- Autocomplete configuration file
-----------------------------------------------------------

-- Plugin: nvim-cmp
-- url: https://github.com/hrsh7th/nvim-cmp


-- load the nvim-cmp
local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
    return
end



-- load the lspkind
local lspkind_ok, lspkind = pcall(require, 'lspkind')

if not lspkind_ok then
    return
end

-- vsnip <tab> function
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

-- snippets path
vim.g.vsnip_snippet_dir = '~/.config/nvim/vsnip'


cmp.setup {
    -- format
    formatting = {
        format = lspkind.cmp_format({
            -- show only symbol annotations
            mode = 'symbol_text',
            menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                vsnip = "[Snip]"
            })
        }),
    },

    --windows
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    -- Load snippet support
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
            -- luasnip.lsp_expand(args.body)
        end,
    },

    -- none select
    preselect = cmp.PreselectMode.None,


    -- Completion settings
    completion = {
        -- completeopt = 'menu,menuone,noselect',
        keyword_length = 1
    },

    -- completion key mapping
    mapping = cmp.mapping.preset.insert({
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
        },

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, { "i", "s" }),
    }),

    -- Load sources, see: https://github.com/topics/nvim-cmp
    sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'buffer' },
        { name = 'path' },
    },
}
