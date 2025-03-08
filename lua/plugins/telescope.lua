return function()
  local telescope = require('telescope')
  local actions = require('telescope.actions')
  local lga_actions = require('telescope-live-grep-args.actions')

  -- Load extensions
  telescope.load_extension('live_grep_args')
  telescope.load_extension('fzf')
  telescope.load_extension('lazygit')

  telescope.setup({
    defaults = {
      layout_strategy = 'vertical',
      layout_config = { width = 0.90 },
      path_display = {"truncate"},
      file_ignore_patterns = {
        "bld*", "build*", "compile%_commands*", "rocksdb_cloud_db",
        "%.o", "%.a", "%.so", "%.cc.d", "logs"
      }
    },
    pickers = {
      buffers = {
        mappings = {
          i = {
            ["<c-x>"] = actions.delete_buffer + actions.move_to_top,
            ["<c-q>"] = actions.smart_add_to_qflist + actions.open_qflist,
            ["<c-k>"] = lga_actions.quote_prompt(),
          }
        }
      }
    },
  })

  -- Create autocommands for telescope previewer
  local telescope_group = vim.api.nvim_create_augroup('TelescopeCustom', { clear = true })
  vim.api.nvim_create_autocmd('User', {
    pattern = 'TelescopePreviewerLoaded',
    group = telescope_group,
    callback = function()
      vim.opt_local.number = true
      vim.opt_local.cursorline = true
    end,
  })

  -- Keymaps
  local map = vim.keymap.set
  local opts = { noremap = true, silent = true }

  -- File finding
  map('n', '<leader>ff', function() vim.cmd("Telescope find_files find_command=rg,--no-ignore-vcs,--files") end, opts)
  map('n', '<leader>fF', function()
    vim.cmd("Telescope find_files find_command=rg,--no-ignore-vcs,--files default_text=" .. vim.fn.expand('<cword>'))
  end, opts)
  map('n', '<leader>fg', function() vim.cmd("Telescope live_grep vimgrep_arguments=rg,--no-ignore-vcs,--no-heading,--with-filename,--line-number,--column") end, opts)
  map('n', '<leader>fG', function()
    vim.cmd("Telescope live_grep vimgrep_arguments=rg,--no-ignore-vcs,--no-heading,--with-filename,--line-number,--column default_text=" .. vim.fn.expand('<cword>'))
  end, opts)
  
  -- Additional telescope mappings
  map('n', '<leader>fr', function() vim.cmd("Telescope live_grep_args") end, opts)
  map('n', '<leader>fb', function() vim.cmd("Telescope buffers") end, opts)
  map('n', '<leader>fh', function() vim.cmd("Telescope help_tags") end, opts)
  map('n', '<leader>fs', function() vim.cmd("Telescope grep_string") end, opts)
  map('n', '<leader>fS', function()
    vim.cmd("Telescope grep_string search=" .. vim.fn.expand('<cword>'))
  end, opts)
  map('n', '<leader>fc', function() vim.cmd("Telescope current_buffer_fuzzy_find") end, opts)
  map('n', '<leader>fC', function()
    vim.cmd("Telescope current_buffer_fuzzy_find default_text=" .. vim.fn.expand('<cword>'))
  end, opts)
  map('n', '<leader>ft', function() vim.cmd("Telescope treesitter") end, opts)
  map('n', '<leader>fT', function()
    vim.cmd("Telescope treesitter default_text=" .. vim.fn.expand('<cword>'))
  end, opts)
  map('n', '<leader>di', function() vim.cmd("Telescope diagnostics") end, opts)

  -- LSP related
  map('n', '<leader>ld', function() vim.cmd("Telescope lsp_document_symbols fname_width=0.38 show_line=true") end, opts)
  map('n', '<leader>lD', function()
    vim.cmd("Telescope lsp_document_symbols fname_width=0.38 show_line=true default_text=" .. vim.fn.expand('<cword>'))
  end, opts)
  map('n', '<leader>lw', function() vim.cmd("Telescope lsp_dynamic_workspace_symbols fname_width=0.38 show_line=true") end, opts)
  map('n', '<leader>lW', function()
    vim.cmd("Telescope lsp_dynamic_workspace_symbols fname_width=0.38 show_line=true default_text=" .. vim.fn.expand('<cword>'))
  end, opts)
  map('n', '<leader>lr', function() vim.cmd("Telescope lsp_references fname_width=0.38") end, opts)
  
  -- Resume
  map('n', '<leader>tr', function() vim.cmd("Telescope resume") end, opts)
end 
