return function()
  require('mini.files').setup({
    -- mini.files 默认 use_as_default_explorer = true，它会在 VimEnter 里执行
    -- `autocmd! FileExplorer *` 来禁用 netrw。但本配置已由 yazi.nvim 接管 netrw
    -- (loaded_netrw=1)，FileExplorer augroup 不存在，该命令会抛
    -- "E216: No such group or event"，并残留到首次打开文件时显示。
    -- 交给 yazi 处理即可，这里关掉。
    options = { use_as_default_explorer = false },
  })
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
