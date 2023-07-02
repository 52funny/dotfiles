local go_augroup = vim.api.nvim_create_augroup("_go", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.format()
    vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
  end,
  group = go_augroup,
})



local rust_group = vim.api.nvim_create_augroup('_rust', { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rs",
  -- command = "Format",
  callback = function()
    vim.lsp.buf.format()
  end,
  group = rust_group,
})


local lua_group = vim.api.nvim_create_augroup('_lua', { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.lua",
  command = "Format",
  group = lua_group,
})
