lua << EOF
require('gitsigns').setup{
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

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
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Actions

    map('n', '<leader>Gs', gitsigns.stage_hunk)
    map('n', '<leader>Gr', gitsigns.reset_hunk)
    map('v', '<leader>Gs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('v', '<leader>Gr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('n', '<leader>GS', gitsigns.stage_buffer)
    map('n', '<leader>Gu', gitsigns.undo_stage_hunk)
    map('n', '<leader>GR', gitsigns.reset_buffer)
    map('n', '<leader>Gp', gitsigns.preview_hunk)
    map('n', '<leader>Gb', function() gitsigns.blame_line{full=true} end)
    map('n', '<leader>Tb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>Gd', gitsigns.diffthis)
    map('n', '<leader>GD', function() gitsigns.diffthis('~') end)
    map('n', '<leader>Td', gitsigns.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
EOF
