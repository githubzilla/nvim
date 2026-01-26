return function()
  -- Settings
  vim.g.lazygit_floating_window_winblend = 0
  vim.g.lazygit_floating_window_scaling_factor = 0.9
  vim.g.lazygit_floating_window_border_chars = {'╭','─', '╮', '│', '╯','─', '╰', '│'}
  vim.g.lazygit_floating_window_use_plenary = 0
  vim.g.lazygit_use_neovim_remote = 1

  -- Keymaps
  vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>', { silent = true })

  -- Auto-change project root
  vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*',
    callback = function()
      require('lazygit.utils').project_root_dir()
    end
  })
end
