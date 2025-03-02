return function()
  -- Set up nearest method function
  vim.cmd([[
    function! NearestMethodOrFunction() abort
      return get(b:, 'vista_nearest_method_or_function', '')
    endfunction
  ]])

  -- Add to statusline
  vim.opt.statusline:append('%{NearestMethodOrFunction()}')

  -- Set default executive
  vim.g.vista_default_executive = 'nvim_lsp'

  -- Keymaps
  local map = vim.keymap.set
  local opts = { silent = true }
  
  map('n', '<leader>v', '<cmd>Vista<cr>', opts)
  map('n', '<leader>vc', '<cmd>Vista!<cr>', opts)
  map('n', '<leader>vt', '<cmd>Vista!!<cr>', opts)
end 