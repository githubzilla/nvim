lua << EOF
require('avante_lib').load()

-- OpenAI
-- require('avante').setup({
--   provider = 'openai',
--   openai = {
-- 	     endpoint = "https://api.openai.com/v1",
-- 	     model = "gpt-4o",
--  	     api_key_name = "my-secret-key-1",
-- 	     proxy = "http://192.168.1.69:6152",
-- 	     allow_insecure = true,
-- 	  }
-- })

-- Anthropic
require('avante').setup({
  provider = "claude",
  claude = {
             endpoint = "https://api.anthropic.com",
             model = "claude-3-5-sonnet-20241022",
	     api_key_name = "my-secret-key-1",
	     proxy = "http://192.168.1.69:6152",
	     allow_insecure = true,
	     timeout = 10000
	  }
})

-- Copilot
-- require('avante').setup({
--    provider = "copilot",
--    copilot = {
-- 	      endpoint = "https://api.githubcopilot.com/",
--               proxy = "http://192.168.1.69:6152",
-- 	      allow_insecure = true,
-- 	   }
-- })

-- DeepSeek
-- require('avante').setup(
--  {
--       provider = "openai",
--       auto_suggestions_provider = "openai", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
--       openai = {
-- 	api_key_name = "my_access_key1",
--         endpoint = "https://api.deepseek.com/v1",
--         model = "deepseek-chat",
--         timeout = 30000, -- Timeout in milliseconds
--         temperature = 0,
--         max_tokens = 4096,
--       },
--  }
-- )

EOF
