return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "rust_analyzer",
          "ruff",
          "bashls",
        }
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
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

      -- Bash
      vim.lsp.config['bashls'] = {
        settings = {
          bashIde = {
            -- Use shellcheck for diagnostics (requires `shellcheck` on PATH)
            shellcheckPath = 'shellcheck',
            -- Only index files matching this glob in the workspace
            globPattern = '*@(.sh|.inc|.bash|.command)',
          },
        },
        -- Also attach to zsh files, not just sh/bash
        filetypes = { 'sh', 'bash', 'zsh' },
      }

      vim.lsp.enable({ 'lua_ls', 'rust_analyzer', 'ruff', 'bashls' })
    end,
  },
}

