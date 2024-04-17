return {
  'jackMort/ChatGPT.nvim',
  event = 'VeryLazy',
  config = function()
    local config = {
      api_host_cmd = 'echo -n "https://risk-business-sweden-central-openai.openai.azure.com"',
      api_type_cmd = 'echo azure',
      azure_api_base_cmd = 'echo https://risk-business-sweden-central-openai.openai.azure.com',
      azure_api_engine_cmd = 'echo risk-business-sweden-central-gpt-4',
      azure_api_version_cmd = 'echo 2024-02-01',
    }

    -- require('chatgpt').setup(config)
  end,
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',
    'folke/trouble.nvim',
    'nvim-telescope/telescope.nvim',
  },
}
