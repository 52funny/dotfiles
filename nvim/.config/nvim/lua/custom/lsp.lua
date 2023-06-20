local M = {}
M.setup = function(on_attach, capabilities)
  local lspconfig = require("lspconfig")
  -- clangd settings
  lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
      "clangd",
      "--clang-tidy",
      "--function-arg-placeholders=false",
      "--fallback-style=microsoft",
      "-j=16"
    },
  }
  lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        assist = {
          importGranularity = "module",
          importPrefix = "by_self",
        },
        completion = {
          callback = {
            snippets = "add_parentheses"
          }
        },
        cargo = {
          loadOutDirsFromCheck = true
        },
        procMacro = {
          enable = true
        },
      }
    }
  }
end
return M
