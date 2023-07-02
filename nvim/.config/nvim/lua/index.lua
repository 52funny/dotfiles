require('custom.keymap')
require('custom.autocmd')
require('custom.options')

local M = {}

M.setup = function(on_attach, capabilities)
    require("custom.lsp").setup(on_attach, capabilities)
end

return M
