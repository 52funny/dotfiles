require('custom.keymap')
require('custom.autocmd')
require('custom.options')
require('custom.colorscheme')

local M = {}

M.setup = function(on_attach, capabilities)
    require("custom.lsp").setup(on_attach, capabilities)
end

return M
