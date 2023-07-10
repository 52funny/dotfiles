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
  -- lspconfig.rust_analyzer.setup({
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  --   settings = {
  --     ["rust-analyzer"] = {
  --       checkOnSave = {
  --         command = "clippy"
  --       },
  --       assist = {
  --         importGranularity = "module",
  --         importPrefix = "by_self",
  --       },
  --       completion = {
  --         callable = {
  --           snippets = "add_parentheses"
  --         }
  --       },
  --       cargo = {
  --         loadOutDirsFromCheck = false
  --       },
  --       procMacro = {
  --         enable = true
  --       },
  --     }
  --   }
  -- })
  local rt = require("rust-tools");
  local opts = {
    tools = {
      reload_workspace_from_cargo_toml = true,
      runnables = {
        use_telescope = true,
      },
      inlay_hints = {
        auto = true,
        show_parameter_hints = false,
        parameter_hints_prefix = "",
        other_hints_prefix = "",
      },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
      -- on_attach is a callback called when the language server attachs to the buffer
      on_attach = function(_, bufnr)
        on_attach(_, bufnr)
        vim.keymap.set("n", "<Leader>h", rt.hover_actions.hover_actions, { buffer = bufnr })
      end,
      capabilities = capabilities,
      filetypes = { "rust" },
      root_dir = util.root_pattern("Cargo.toml"),
      settings = {
        -- to enable rust-analyzer settings visit:
        -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
        ["rust-analyzer"] = {
          -- enable clippy on save
          checkOnSave = {
            command = "clippy",
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
            enable = true,
          },
        },
      },
      -- options same as lsp hover / vim.lsp.util.open_floating_preview()
      hover_actions = {

        -- the border that is used for the hover window
        -- see vim.api.nvim_open_win()
        border = {
          { "╭", "FloatBorder" },
          { "─", "FloatBorder" },
          { "╮", "FloatBorder" },
          { "│", "FloatBorder" },
          { "╯", "FloatBorder" },
          { "─", "FloatBorder" },
          { "╰", "FloatBorder" },
          { "│", "FloatBorder" },
        },

        -- Maximal width of the hover window. Nil means no max.
        max_width = nil,

        -- Maximal height of the hover window. Nil means no max.
        max_height = nil,

        -- whether the hover action window gets automatically focused
        -- default: false
        auto_focus = true,
      },

    },
  }
  rt.setup(opts)

  -- latex
  lspconfig.ltex.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    -- filetypes = { "markdown", "tex", "bib" },
  })
  lspconfig.digestif.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end
return M
