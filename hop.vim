lua <<EOF
require'hop'.setup()
vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
EOF
" Hop
    "normal
        "up
        nmap K :HopLineStartBC<CR>
        "down
        nmap J :HopLineStartAC<CR>
        "left
        nmap H :HopWordCurrentLineBC<CR>
        "right
        nmap L :HopWordCurrentLineAC<CR>
        "char anywhere
        nmap f :HopChar1<CR>
        "pattern anywhere
        nmap s :HopPattern<CR>
    "visual
        "up
        vmap K <cmd>HopLineStartBC<CR>
        "down
        vmap J <cmd>HopLineStartAC<CR>
        "left
        vmap H <cmd>HopWordCurrentLineBC<CR>
        "right
        vmap L <cmd>HopWordCurrentLineAC<CR>
        "char anywhere
        vmap f <cmd>HopChar1<CR>
        "pattern anywhere
        vmap s <cmd>HopPattern<CR>
