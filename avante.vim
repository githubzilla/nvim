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
--require('avante').setup({
--  provider = "claude",
--  claude = {
--             endpoint = "https://api.anthropic.com",
--             model = "claude-3-5-sonnet-20241022",
--	     api_key_name = "my-secret-key-1",
--	     proxy = "http://192.168.1.69:6152",
--	     allow_insecure = true,
--	     timeout = 10000
--	  }
--})

-- Copilot
-- require('avante').setup({
--    provider = "copilot",
--    copilot = {
-- 	   endpoint = "https://api.githubcopilot.com/",
--            model = "claude-3.5-sonnet",
--            proxy = "http://192.168.1.69:6152",
-- 	   allow_insecure = true,
-- 	   disable_tools = true,
-- 	   },
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

-- Openroute.ai
require('avante').setup({
   provider = "copilot",
   auto_suggestions_provider = "copilot",
   copilot = {
           model = "claude-3.7-sonnet",
           proxy = "http://192.168.1.69:6152",
	   max_tokens = 655360
	   },
   vendors = {
	   ["gemini-2.0"] = {
		   __inherited_from = "openai",
		   api_key_name = "avantekey",
		   endpoint = "https://openrouter.ai/api/v1",
		   model = "google/gemini-2.0-flash-001",
		   disable_tools = true,
		   timeout = 30000,
		   },
	   ["deepseek-r1"] = {
		   __inherited_from = "openai",
		   api_key_name = "avantekey",
		   endpoint = "https://openrouter.ai/api/v1",
		   model = "deepseek/deepseek-r1:free",
		   disable_tools = true,
		   timeout = 30000,
		   },
	   -- claude is too expensive
	   -- ["claude-3.5-haiku"] = {
	   --         __inherited_from = "openai",
	   --         api_key_name = "avantekey",
	   --         endpoint = "https://openrouter.ai/api/v1",
	   --         model = "anthropic/claude-3.5-haiku",
	   --         disable_tools = true,
	   --         timeout = 30000,
	   --         },
	   -- ["claude-3.5-sonnet"] = {
	   --         __inherited_from = "openai",
	   --         api_key_name = "avantekey",
	   --         endpoint = "https://openrouter.ai/api/v1",
	   --         model = "anthropic/claude-3.5-sonnet",
	   --         disable_tools = true,
	   --         timeout = 30000,
	   --         },
	   ["openai-o3-mini"] = {
		   __inherited_from = "openai",
		   api_key_name = "avantekey",
		   endpoint = "https://openrouter.ai/api/v1",
		   model = "openai/o3-mini",
		   timeout = 30000,
		   },
	   },
   file_selector = {
	   provider = "telescope",
	   provider_opts = {
                find_command = { "rg", "--no-ignore-vcs", "--files"} -- this can make avante file select a bit fast
            }
	   },
   behaviour = {
	   auto_suggestions = false,
           enable_token_counting = false, -- counting token can be very slow
	   },
   suggestion = {
	   debounce = 600,
	   throttle = 600,
	   },
})

EOF
