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
      local lspconfig = vim.lsp.config

      -- Lua
      vim.lsp.config['lua_ls'] = {
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
            workspace = { checkThirdParty = "Disable" },
          },
        },
      }

      -- Rust
      vim.lsp.config['rust_analyzer'] = {
        settings = {
          ['rust-analyzer'] = {
            check = {
              command = "clippy",
            },
            diagnostics = {
              enable = true,
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
              enable = true,
            },
          },
        },
      }

      vim.lsp.enable({ 'lua_ls', 'rust_analyzer' })
    end,
  },
}

