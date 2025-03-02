return function()
  require('smear_cursor').setup({
    enable = true,
    cursor_color = "#d3cdc3",
    stiffness = 0.8,
    trailing_stiffness = 0.5,
    distance_stop_animating = 0.5,
    hide_target_hack = false,
  })
end 