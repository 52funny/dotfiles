-- local runners = { lua = 'lua', javascript = 'node' }

-- vim.keymap.set('n', '<leader><Enter>', function()
--     local buf = vim.api.nvim_buf_get_name(0)
--
--     local ftype = vim.filetype.match({ filename = buf })
--     if ftype == "rust" then
--         require('FTerm').scratch({ cmd = { 'cargo', 'run' } })
--     else
--         local exec = runners[ftype]
--         if exec ~= nil then
--             require('FTerm').scratch({ cmd = { exec, buf } })
--         end
--     end
--
-- end)
--#region


local go_org_imports = function(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = { only = { "source.organizeImports" } }
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for cid, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
        vim.lsp.util.apply_workspace_edit(r.edit, enc)
      end
    end
  end
end

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = { "*.go" },
--   callback = function()
--     vim.lsp.buf.formatting_sync(nil, 3000)
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = { "*.go" },
--   callback = function()
--     local params = vim.lsp.util.make_range_params(nil, vim.lsp.util._get_offset_encoding())
--     params.context = { only = { "source.organizeImports" } }
--
--     local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
--     for _, res in pairs(result or {}) do
--       for _, r in pairs(res.result or {}) do
--         if r.edit then
--           vim.lsp.util.apply_workspace_edit(r.edit, vim.lsp.util._get_offset_encoding())
--         else
--           vim.lsp.buf.execute_command(r.command)
--         end
--       end
--     end
--   end,
-- })


local go_augroup = vim.api.nvim_create_augroup("_go", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.formatting_sync(nil, 500)
    go_org_imports(1000)
  end,
  group = go_augroup,
})



local rust_group = vim.api.nvim_create_augroup('_rust', { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rs",
  command = "Format",
  group = rust_group,
})


local lua_group = vim.api.nvim_create_augroup('_lua', { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.lua",
  command = "Format",
  group = lua_group,
})


-- vim.cmd [[ augroup _go autocmd BufWritePre *.go :%!goimports end ]]
