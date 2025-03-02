return function()
  vim.g.vimspector_ui_mode = 'horizontal'
  vim.g.vimspector_enable_mappings = 'HUMAN'
  vim.g.vimspector_install_gadgets = { 'CodeLLDB' }

  local map = vim.keymap.set
  local opts = { silent = true }
  
  map('n', '<leader>dl', ':call vimspector#Launch()<CR>', opts)
  map('n', '<leader>dx', ':VimspectorReset<CR>', opts)
  map('n', '<leader>de', ':VimspectorEval', opts)
  map('n', '<leader>dw', ':VimspectorWatch', opts)
  map('n', '<leader>do', ':VimspectorShowOutput', opts)
  map('n', '<leader>db', ':VimspectorBreakpoints', opts)
end 