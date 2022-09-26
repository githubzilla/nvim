let g:vimspector_ui_mode = 'horizontal'
let g:vimspector_enable_mappings = 'HUMAN'
nnoremap <leader>dl :call vimspector#Launch()<CR>
nnoremap <leader>dx :VimspectorReset<CR>
nnoremap <leader>de :VimspectorEval
nnoremap <leader>dw :VimspectorWatch
nnoremap <leader>do :VimspectorShowOutput
nnoremap <Leader>db :VimspectorBreakpoints
let g:vimspector_install_gadgets = [ 'CodeLLDB' ]
