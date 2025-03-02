return function()
  vim.g.clang_format = {
    detect_style_file = 1,
    command = '/usr/bin/clang-format-17'
  }
  
  vim.keymap.set('n', '<leader>cf', '<cmd>ClangFormat<cr>', { silent = true })
end 