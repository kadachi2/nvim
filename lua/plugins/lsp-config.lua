return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "rust_analyzer",
          "ruff",
        }
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      local on_attach = function(client)
        require("completion").on_attach(client)
      end

      lspconfig.lua_ls.setup({})
      lspconfig.rust_analyzer.setup {
        on_attach = on_attach,
        settings = {
          ['rust-analyzer'] = {
            check = {
              command = "clippy"
            },
            diagonostics = {
              enable = true;
            },
            imports = {
              granularity = {
                group = "module",
              },
              prefix = "self",
            },
            cargo = {
              buildScripts = {
                enable = true,
              },
            },
            procMacro = {
              enable = true
            },
          }
        }
      }
    end,
  }
}

