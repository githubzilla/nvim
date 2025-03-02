return function()
  local binary_group = vim.api.nvim_create_augroup('Binary', { clear = true })
  
  vim.api.nvim_create_autocmd({ 'BufReadPre' }, {
    pattern = '*.bin',
    group = binary_group,
    callback = function()
      vim.opt.binary = true
    end,
  })

  vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
    pattern = '*.bin',
    group = binary_group,
    callback = function()
      if vim.opt.binary:get() then
        vim.cmd('%!xxd')
        vim.opt.filetype = 'xxd'
      end
    end,
  })

  vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    pattern = '*.bin',
    group = binary_group,
    callback = function()
      if vim.opt.binary:get() then
        vim.cmd('%!xxd -r')
      end
    end,
  })

  vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    pattern = '*.bin',
    group = binary_group,
    callback = function()
      if vim.opt.binary:get() then
        vim.cmd('%!xxd')
        vim.opt.modified = false
      end
    end,
  })
end 