" Load extensions
lua <<EOF
require("telescope").load_extension("live_grep_args")
require('telescope').load_extension('fzf')
require('telescope').load_extension('lazygit')

local actions = require "telescope.actions"
local lga_actions = require("telescope-live-grep-args.actions")

require('telescope').setup{
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = { width = 0.90, height = 0.90, preview_width = 0.5 },
    path_display={"smart"}
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
  }
}
EOF

" Set line number for previewer
autocmd User TelescopePreviewerLoaded setlocal number
" Underline the cursor line
autocmd User TelescopePreviewerLoaded setlocal cursorline
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files find_command=rg,--no-ignore-vcs,--files<cr>
nnoremap <leader>fF :execute 'Telescope find_files find_command=rg,--no-ignore-vcs,--files prompt_prefix=🔍 default_text=' . "" . expand('<cword>')<cr>
nnoremap <leader>fg <cmd>Telescope live_grep vimgrep_arguments=rg,--no-ignore-vcs,--no-heading,--with-filename,--line-number,--column<cr>
nnoremap <leader>fG :execute 'Telescope live_grep vimgrep_arguments=rg,--no-ignore-vcs,--no-heading,--with-filename,--line-number,--column default_text=' . "" . expand('<cword>')<cr>
nnoremap <leader>fr <cmd>Telescope live_grep_args<cr>
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
nnoremap <leader>ld <cmd>Telescope lsp_document_symbols show_line=true<cr>
nnoremap <expr> <leader>lD ':Telescope lsp_document_symbols show_line=true<cr>' . expand('<cword>')
nnoremap <leader>lw <cmd>Telescope lsp_dynamic_workspace_symbols show_line=true<cr>
nnoremap <expr> <leader>lW ':Telescope lsp_dynamic_workspace_symbols show_line=true<cr>' . expand('<cword>')
nnoremap <leader>lr <cmd>Telescope lsp_references<cr>
