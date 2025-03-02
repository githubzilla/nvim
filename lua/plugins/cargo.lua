return function()
  local map = vim.keymap.set
  local opts = { noremap = true, silent = true }

  map('n', '<leader>cgb', ':CargoBuild<CR>', opts)
  map('n', '<leader>cgr', ':CargoRun<CR>', opts)
  map('n', '<leader>cgc', ':CargoClean<CR>', opts)
  map('n', '<leader>cgt', ':CargoTest<CR>', opts)
end 