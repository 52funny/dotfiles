vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

local indent_group = vim.api.nvim_create_augroup('custom-indent-settings', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = indent_group,
  pattern = { 'c', 'cpp', 'cs', 'go', 'java', 'kotlin', 'python', 'rust' },
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.expandtab = true
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = indent_group,
  pattern = { 'make' },
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.expandtab = false
  end,
})
