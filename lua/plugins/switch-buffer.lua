return function()
  vim.keymap.set('n', 'B', ':SwitchBuffer<CR>', { noremap = true, silent = true })
  vim.opt.switchbuf = 'usetab'
end 