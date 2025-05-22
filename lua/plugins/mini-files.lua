return function()
  require('mini.files').setup()
  -- Add key mapping for \mf to open MiniFiles
  vim.keymap.set('n', '<leader>mf', ':lua MiniFiles.open()<CR>', { noremap = true, silent = true })
  -- Add key mapping for \mp to open MiniFiles at the current buffer's path
  vim.keymap.set('n', '<leader>mp', function()
    local bufname = vim.api.nvim_buf_get_name(0)
    if bufname == "" then
      -- If buffer has no name (new file), use current working directory
      MiniFiles.open()
    else
      -- Open at the directory of the current buffer
      local dir = vim.fn.fnamemodify(bufname, ':h')
      MiniFiles.open(dir)
    end
  end, { noremap = true, silent = true, desc = "Open MiniFiles at current buffer path" })
end
