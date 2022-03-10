" Load extensions
lua <<EOF
local actions = require "telescope.actions"
require('telescope').setup{
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = { width = 0.98, height = 0.99 }
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<c-x>"] = actions.delete_buffer + actions.move_to_top,
        }
      }
    }
  }
}
require('telescope').load_extension('live_grep_raw')
require('telescope').load_extension('fzf')
EOF

" set line number for previewer
autocmd User TelescopePreviewerLoaded setlocal number
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
nnoremap <leader>di <cmd>Telescope diagnostics<cr>
" lsp
nnoremap <leader>lds <cmd>Telescope lsp_document_symbols<cr>
nnoremap <expr> <leader>ldS ':Telescope lsp_document_symbols<cr>' . expand('<cword>')
nnoremap <leader>lws <cmd>Telescope lsp_dynamic_workspace_symbols<cr>
nnoremap <expr> <leader>lwS ':Telescope lsp_dynamic_workspace_symbols<cr>' . expand('<cword>')
nnoremap <leader>lr <cmd>Telescope lsp_references<cr>
