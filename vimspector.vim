let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
nmap <LocalLeader><F11> <Plug>VimspectorUpFrame
nmap <LocalLeader><F12> <Plug>VimspectorDownFrame
let g:vimspector_install_gadgets = [ 'CodeLLDB' ]
