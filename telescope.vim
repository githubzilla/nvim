" Load extensions
lua <<EOF
require('telescope').load_extension('live_grep_raw')
require('telescope').load_extension('fzf')
EOF

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files find_command=rg,--no-ignore-vcs,--files<cr>
nnoremap <expr> <leader>fF ':Telescope find_files find_command=rg,--no-ignore-vcs,--files prompt_prefix=🔍<cr>' . expand('<cword>')
nnoremap <leader>fg <cmd>Telescope live_grep vimgrep_arguments=rg,--no-ignore-vcs,--no-heading,--with-filename,--line-number,--column<cr>
nnoremap <leader>fr <cmd>Telescope live_grep_raw<cr>
nnoremap <expr> <leader>fG ':Telescope live_grep vimgrep_arguments=rg,--no-ignore-vcs,--no-heading,--with-filename,--line-number,--column<cr>' . expand('<cword>')
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs <cmd>Telescope grep_string<cr>
nnoremap <expr> <leader>fS ':Telescope grep_string<cr>' . expand('<cword>')
nnoremap <leader>fc <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <expr> <leader>fC ':Telescope current_buffer_fuzzy_find<cr>' . expand('<cword>')
nnoremap <leader>ft <cmd>Telescope treesitter<cr>
nnoremap <expr> <leader>fT ':Telescope treesitter<cr>' . expand('<cword>')
