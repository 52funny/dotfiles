require('custom.keymap')
require('custom.autocmd')
require('custom.options')
require('custom.dap')


-- lsp no underline
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--     vim.lsp.diagnostic.on_publish_diagnostics, {
--         underline = false,
--         -- virtual_text = {
--         --     spacing = 4,
--         --     prefix = "",
--         -- },
--         -- signs = true,
--         -- update_in_insert = false,
--     }
-- )
local M = {}

M.setup = function(on_attach, capabilities)
    require("custom.lsp").setup(on_attach, capabilities)
end

return M
