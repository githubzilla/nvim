return function()
    -- Define common filter pattern for ripgrep
    local common_filter =
        "--no-ignore-vcs --glob=!*.o --glob=!*.d --glob=!bld/** --glob=!bin/** --glob=!.git/** --glob=!.cache/** --glob=!node_modules/** --glob=!build/** --glob=!compile_commands.json"

    require('avante_lib').load()

    require('avante').setup({
        provider = "opencode",
        acp_providers = {
          ["opencode"] = {
            command = "opencode",
            args = { "acp" }

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
    })

    -- Register keymappings
    vim.keymap.set('n', '<leader>al', '<cmd>AvanteClear<cr>',
                   {desc = 'Clear Avante context'})
end
