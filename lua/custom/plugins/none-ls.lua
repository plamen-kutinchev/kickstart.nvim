return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'
    null_ls.setup {
      sources = {
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier.with {
          filetypes = { 'html', 'json', 'markdown' },
        },
        null_ls.builtins.diagnostics.erb_lint,
        null_ls.builtins.diagnostics.rubocop,
        null_ls.builtins.formatting.rubocop,
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.diagnostics.mypy.with {
          extra_args = function()
            local virtual = os.getenv 'VIRTUAL_ENV' or os.getenv 'CONDA_PREFIX' or '/usr'
            return { '--python-executable', virtual .. '/bin/python3' }
          end,
        },
      },
    }

    vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
  end,
}
