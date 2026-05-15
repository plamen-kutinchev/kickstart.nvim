return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false,
  build = 'make',
  opts = {
    provider = 'langdock_claude',
    providers = {
      langdock_claude = {
        __inherited_from = 'claude',
        endpoint = 'https://api.langdock.com/anthropic/eu',
        model = 'claude-opus-4-7-default',
        api_key_name = 'LANGDOCK_API_KEY',
        -- Strip params Opus 4.7 rejects
        parse_curl_args = function(opts, code_opts)
          local claude = require 'avante.providers.claude'
          local args = claude.parse_curl_args(opts, code_opts)
          if args.body then
            args.body.temperature = nil
            args.body.top_p = nil
          end
          return args
        end,
      },
    },
  },
}
