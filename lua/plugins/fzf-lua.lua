return function()
    require("fzf-lua").setup({
        -- Open in window mode instead of popup
        winopts = {
            -- Set to empty string to use regular Neovim window
            preview = {
                default = "builtin",
            },
            -- Use a standard split window instead of a popup
            split = "belowright new",
            height = 0.4,  -- 40% of screen height
            width = 1.0,   -- Full width
            border = false,
            fullscreen = false,
        },
        fzf_opts = {
            ["--layout"] = "reverse", -- Cursor at top
            ["--info"] = "inline",
        },
        files = {
            actions = {["default"] = "tabedit"} -- Preserve your default action
        },
    })
end
