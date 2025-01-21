lua << EOF
require('smear_cursor').setup({
    enable = true,
    -- Smear cursor color. Defaults to Cursor GUI color if not set.
    -- Set to "none" to match the text color at the target cursor position.
    cursor_color = "#d3cdc3",
    -- Faster smear
    stiffness = 0.8,               -- 0.6      [0, 1]
    trailing_stiffness = 0.5,      -- 0.3      [0, 1]
    distance_stop_animating = 0.5, -- 0.1      > 0
    hide_target_hack = false,      -- true     boolean
})
EOF
