return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function()
      local hooks = require 'ibl.hooks'

      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        local normal = vim.api.nvim_get_hl(0, { name = 'Normal', link = false })
        local hidden = normal.bg or 0x2D353B

        vim.api.nvim_set_hl(0, 'IblIndent', { fg = hidden, nocombine = true })
        vim.api.nvim_set_hl(0, 'IblWhitespace', { fg = hidden, nocombine = true })
        vim.api.nvim_set_hl(0, 'IblScope', { fg = '#7A8478', nocombine = true })
      end)

      require('ibl').setup {
        indent = {
          highlight = 'IblIndent',
          char = '▏',
        },
        whitespace = {
          highlight = 'IblWhitespace',
          remove_blankline_trail = false,
        },
        scope = {
          enabled = true,
          highlight = 'IblScope',
          char = '▏',
        },
      }
    end,
  },
}
