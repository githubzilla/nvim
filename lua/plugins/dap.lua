return function()
  local dap = require('dap')

  -- Configurations
  dap.configurations.cpp = {
    {
      name = "Launch",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = true,
    },
  }

  -- Share configuration between C/C++ and Rust
  dap.configurations.c = dap.configurations.cpp
  dap.configurations.rust = dap.configurations.cpp

  -- Keymaps
  local map = vim.keymap.set
  local opts = { noremap = true, silent = true }

  map('n', '<F5>', function() dap.continue() end, opts)
  map('n', '<F10>', function() dap.step_over() end, opts)
  map('n', '<F11>', function() dap.step_into() end, opts)
  map('n', '<F12>', function() dap.step_out() end, opts)
  map('n', '<leader>b', function() dap.toggle_breakpoint() end, opts)
  map('n', '<leader>B', function() 
    dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
  end, opts)
  map('n', '<leader>lp', function()
    dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
  end, opts)
  map('n', '<leader>dr', function() dap.repl.open() end, opts)
  map('n', '<leader>dl', function() dap.run_last() end, opts)
end 