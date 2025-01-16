lua << EOF
require('avante_lib').load()
-- require('avante').setup({
--   provider = 'openai',
--   openai = {
--  	     api_key_name = "my-secret-key-1",
-- 	  }
-- })
-- require('avante').setup({
--   provider = "claude",
--   claude = {
-- 	     api_key_name = "my-secret-key-1",
-- 	     proxy = "http://192.168.98.61:6152",
-- 	  }
-- })
-- require('avante').setup({
--    provider = "copilot",
--    copilot = {
-- 	   endpoint = "https://api.githubcopilot.com/",
-- 	   }
-- })

require('avante').setup(
 {
      provider = "openai",
      auto_suggestions_provider = "openai", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
      openai = {
	api_key_name = "my_access_key1",
        endpoint = "https://api.deepseek.com/v1",
        model = "deepseek-chat",
        timeout = 30000, -- Timeout in milliseconds
        temperature = 0,
        max_tokens = 4096,
      },
 }
)
EOF
