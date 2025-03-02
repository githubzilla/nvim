return function()
  -- Set global options
  vim.g.asyncrun_open = 6
  vim.g.asyncrun_rootmarks = {'.git', '.svn', '.root', '.project', '.hg'}

  -- Key mappings
  local map = vim.keymap.set
  local opts = { noremap = true, silent = true }

  map('n', '<leader>pb', ':AsyncTask project-build<CR>', opts)
  map('n', '<leader>pi', ':AsyncTask project-install<CR>', opts)
end 