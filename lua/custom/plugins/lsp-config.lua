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
      -- stylua is a formatter, not a language server. Left to itself
      -- mason-lspconfig tries to start it as one and it exits with code 2.
      automatic_enable = { exclude = { 'stylua' } },
    },
  },
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    config = function()
      -- Broadcast nvim-cmp's extra completion capabilities to every server.
      vim.lsp.config('*', {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })

      local servers = {
        ts_ls = {},
        solargraph = {},
        html = {},
        lua_ls = {},
        pyright = {},
        yamlls = {},
        zls = {},
        jsonls = {},
        gopls = {
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
        },
      }

      for name, config in pairs(servers) do
        vim.lsp.config(name, config)
      end

      -- `vim.lsp.config` only registers settings -- a server also has to be
      -- enabled before it will ever attach to a buffer. Servers installed
      -- through Mason are enabled by mason-lspconfig, so this only covers the
      -- ones that come from $PATH (e.g. a `go install`ed gopls).
      local enable = {}
      for name in pairs(servers) do
        local cmd = (vim.lsp.config[name] or {}).cmd
        if type(cmd) == 'table' and cmd[1] and vim.fn.executable(cmd[1]) == 1 then
          enable[#enable + 1] = name
        end
      end
      if #enable > 0 then
        vim.lsp.enable(enable)
      end

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    end,
  },
}
