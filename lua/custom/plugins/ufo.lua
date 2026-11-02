return {
  'kevinhwang91/nvim-ufo',
  lazy = false,
  dependencies = { 'kevinhwang91/promise-async' },
  config = function()
    require('ufo').setup {
      provider_selector = function(bufnr, filetype, buftype)
        -- Snacks.gh buffers fold themselves via treesitter foldexpr
        if filetype == 'markdown.gh' then
          return ''
        end
        return { 'treesitter', 'indent' }
      end,
    }
  end,
}
