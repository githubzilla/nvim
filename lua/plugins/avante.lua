return function()
    -- Define common filter pattern for ripgrep
    local common_filter =
        "--no-ignore-vcs --glob=!*.o --glob=!*.d --glob=!bld/** --glob=!bin/** --glob=!.git/** --glob=!.cache/** --glob=!node_modules/** --glob=!build/** --glob=!compile_commands.json"

    require('avante_lib').load()

    require('avante').setup({
        provider = "copilot",
        auto_suggestions_provider = "copilot",
        providers = {
            copilot = {
		-- model = "gpt-5",
                model = "claude-3.7-sonnet",
                -- model = "claude-sonnet-4",
                extra_request_body = {max_tokens = 655360},
                -- proxy = "http://192.168.1.69:6152",
                -- allow_insecure = true,
            },
            openai = {
                api_key_name = "my_access_key1",
                endpoint = "https://api.deepseek.com",
                model = "deepseek-chat",
                timeout = 30000
            },
            vendors = {
                ["gemini-2.0"] = {
                    __inherited_from = "openai",
                    api_key_name = "avantekey",
                    endpoint = "https://openrouter.ai/api/v1",
                    model = "google/gemini-2.0-flash-001",
                    disable_tools = true,
                    timeout = 30000
                },
                ["deepseek-r1"] = {
                    __inherited_from = "openai",
                    api_key_name = "avantekey",
                    endpoint = "https://openrouter.ai/api/v1",
                    model = "deepseek/deepseek-r1:free",
                    disable_tools = true,
                    timeout = 30000
                },
                ["openai-o3-mini"] = {
                    __inherited_from = "openai",
                    api_key_name = "avantekey",
                    endpoint = "https://openrouter.ai/api/v1",
                    model = "openai/o3-mini",
                    timeout = 30000
                }
            }
        },
        selector = {
            provider = "fzf_lua",
            provider_opts = {
                find_command = {"rg", "--files " .. common_filter} -- this can make avante file select a bit fast
            }
        },
        behaviour = {
            auto_suggestions = false,
            enable_token_counting = false -- counting token can be very slow
        },
        suggestion = {debounce = 600, throttle = 600},
	rag_service = {
	    enabled = true,
	    runner = "docker",
	    docker_extra_args = "-v /mnt/bigfoot/tianxj_workspace:/mnt/bigfoot/tianxj_workspace -v /mnt/bigfoot/tianxj_hive:/mnt/bigfoot/tianxj_hive",
	    llm = {
	       provider = "dashscope",
               endpoint = "https://dashscope.aliyuncs.com/compatible-mode/v1",
               api_key = "DASHSCOPE_API_KEY",
	       model = "qwen-plus",
	    },
	    embed = {
	       provider = "dashscope",
               endpoint = "https://dashscope.aliyuncs.com/compatible-mode/v1",
               api_key = "DASHSCOPE_API_KEY",
	       model = "text-embedding-v3",
               extra = { -- Extra configuration options for the Embedding model (optional)
                 embed_batch_size = 10,
               },
	    },
	},
    })

    -- Register keymappings
    vim.keymap.set('n', '<leader>al', '<cmd>AvanteClear<cr>',
                   {desc = 'Clear Avante context'})
end
