return {
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = function()
      require('mason').setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- TypeScript/JavaScript
      vim.lsp.config('ts_ls', {
        capabilities = capabilities,
      })
      
      -- Ruby
      vim.lsp.config('solargraph', {
        capabilities = capabilities,
      })
      
      -- HTML
      vim.lsp.config('html', {
        capabilities = capabilities,
      })
      
      -- Lua
      vim.lsp.config('lua_ls', {
        capabilities = capabilities,
      })
      
      -- Python
      vim.lsp.config('pyright', {
        capabilities = capabilities,
      })
      
      -- YAML
      vim.lsp.config('yamlls', {
        capabilities = capabilities,
      })
      
      -- Zig
      vim.lsp.config('zls', {
        capabilities = capabilities,
      })
      
      -- Go
      vim.lsp.config('gopls', {
        capabilities = capabilities,
        settings = {
          gopls = {
            analyses = {
              nilness = true,
              unusedparams = true,
              unusedvariable = true,
              unusedwrite = true,
              useany = true,
            },
            gofumpt = true,
            staticcheck = true,
            usePlaceholders = true,
          },
        },
      })
      
      -- JSON
      vim.lsp.config('jsonls', {
        capabilities = capabilities,
      })

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    end,
  },
}
