return function()

require('treesitter-context').setup({
  enable = true, -- Enable this plugin (can be enabled later via commands)
  max_lines = 20, -- How many lines the window can be from the top of the screen
  trim_scope = 'outer', -- Which context lines to display: 'outer' shows more context
  min_window_height = 0, -- Minimum window height to enable context
  line_numbers = true, -- Whether to display line numbers
  mode = 'smart', -- Mode to show context: 'cursor', 'topline', or 'smart'
  multiline_threshold = 10, -- Maximum number of lines to show for a single context
  zindex = 20, -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
});
 
vim.cmd("hi TreesitterContext guibg=#414a58")
end
