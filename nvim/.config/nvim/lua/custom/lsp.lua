local M = {}
local util = require("lspconfig.util")

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

  -- go
  lspconfig.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      ["gopls"] = {
        experimentalPostfixCompletions = true,
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
      },
    }
  })


  -- rust
  lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy"
        },
        assist = {
          importGranularity = "module",
          importPrefix = "by_self",
        },
        completion = {
          callable = {
            snippets = "add_parentheses"
          }
        },
        cargo = {
          loadOutDirsFromCheck = false
        },
        procMacro = {
          enable = true
        },
      }
    }
  })

  -- local opts = {
  --   tools = {
  --     runnables = {
  --       use_telescope = true,
  --     },
  --     inlay_hints = {
  --       auto = true,
  --       show_parameter_hints = false,
  --       parameter_hints_prefix = "",
  --       other_hints_prefix = "",
  --     },
  --   },
  --
  --   -- all the opts to send to nvim-lspconfig
  --   -- these override the defaults set by rust-tools.nvim
  --   -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  --   server = {
  --     -- on_attach is a callback called when the language server attachs to the buffer
  --     on_attach = on_attach,
  --     capabilities = capabilities,
  --     filetypes = { "rust" },
  --     root_dir = util.root_pattern("Cargo.toml"),
  --     settings = {
  --       -- to enable rust-analyzer settings visit:
  --       -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
  --       ["rust-analyzer"] = {
  --         -- enable clippy on save
  --         checkOnSave = {
  --           command = "clippy",
  --         },
  --         assist = {
  --           importGranularity = "module",
  --           importPrefix = "by_self",
  --         },
  --         completion = {
  --           callable = {
  --             snippets = "add_parentheses"
  --           }
  --         },
  --         cargo = {
  --           loadOutDirsFromCheck = false
  --         },
  --         procMacro = {
  --           enable = true,
  --         },
  --       },
  --     },
  --   },
  -- }
  -- require("rust-tools").setup(opts)
end
return M
