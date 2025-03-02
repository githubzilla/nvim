return function()
  vim.g.dash_map = {
    cpp = {'llvm', 'clang', 'cpp'}
  }

  vim.keymap.set('n', '<Leader>h', ':Dash<CR>', { noremap = true, silent = true })
end 