return function()
  vim.g.workspace_autocreate = 1
  vim.g.workspace_autosave_always = 0
  vim.g.workspace_autosave = 0
  vim.g.workspace_session_name = '.workspace_session.vim'

  vim.keymap.set('n', '<leader>s', ':ToggleWorkspace<CR>', { silent = true })
end 