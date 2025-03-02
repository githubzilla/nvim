return function()
  require('avante_lib').load()

  require('avante').setup({
    provider = "copilot",
    auto_suggestions_provider = "copilot",
    copilot = {
      model = "claude-3.7-sonnet",
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
    },
    behaviour = {
      auto_suggestions = false,
    },
    suggestion = {
      debounce = 600,
      throttle = 600,
    },
  })
end 