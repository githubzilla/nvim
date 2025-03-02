return function()
  require('gitsigns').setup({
    on_attach = function(bufnr)
      local gs = require('gitsigns')

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal({']c', bang = true})
        else
          gs.next_hunk()
        end
      end)

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal({'[c', bang = true})
        else
          gs.prev_hunk()
        end
      end)

      -- Actions
      map('n', '<leader>Gs', gs.stage_hunk)
      map('n', '<leader>Gr', gs.reset_hunk)
      map('v', '<leader>Gs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
      map('v', '<leader>Gr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
      map('n', '<leader>GS', gs.stage_buffer)
      map('n', '<leader>Gu', gs.undo_stage_hunk)
      map('n', '<leader>GR', gs.reset_buffer)
      map('n', '<leader>Gp', gs.preview_hunk)
      map('n', '<leader>Gb', function() gs.blame_line{full=true} end)
      map('n', '<leader>Tb', gs.toggle_current_line_blame)
      map('n', '<leader>Gd', gs.diffthis)
      map('n', '<leader>GD', function() gs.diffthis('~') end)
      map('n', '<leader>Td', gs.toggle_deleted)

      -- Text object
      map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
  })
end 