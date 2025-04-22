return function()
  require('mini.files').setup()
  -- Add key mapping for \mf to open MiniFiles
  vim.keymap.set('n', '<leader>mf', ':lua MiniFiles.open()<CR>', { noremap = true, silent = true })
end
