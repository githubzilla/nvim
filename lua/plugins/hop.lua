return function()
  local hop = require('hop')
  local directions = require('hop.hint').HintDirection
  hop.setup()

  -- Function key mappings
  local map = vim.keymap.set
  local opts = { noremap = true, silent = true }

  -- Single character movements
  map('n', 'f', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
  end, opts)
  map('n', 'F', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
  end, opts)
  map('o', 'f', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })
  end, opts)
  map('o', 'F', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })
  end, opts)
  map('', 't', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
  end, opts)
  map('', 'T', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
  end, opts)

  -- Navigation mappings
  map('n', 'K', ':HopLineStartBC<CR>', opts)
  map('n', 'J', ':HopLineStartAC<CR>', opts)
  map('n', 'H', ':HopWordCurrentLineBC<CR>', opts)
  map('n', 'L', ':HopWordCurrentLineAC<CR>', opts)
  map('n', 'f', ':HopChar1<CR>', opts)
  map('n', 'F', ':HopChar2<CR>', opts)
  map('n', 's', ':HopPattern<CR>', opts)

  -- Visual mode mappings
  map('v', 'K', '<cmd>HopLineStartBC<CR>', opts)
  map('v', 'J', '<cmd>HopLineStartAC<CR>', opts)
  map('v', 'H', '<cmd>HopWordCurrentLineBC<CR>', opts)
  map('v', 'L', '<cmd>HopWordCurrentLineAC<CR>', opts)
  map('v', 'f', '<cmd>HopChar1<CR>', opts)
  map('v', 'F', ':HopChar2<CR>', opts)
  map('v', 's', '<cmd>HopPattern<CR>', opts)
end 