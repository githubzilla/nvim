"== tabline navigation ==
nnoremap <c-S-tab> :bprevious<CR>
nnoremap <c-tab>   :bnext<CR>
"== quickfix navigation ==
nnoremap <leader>qn :cn<CR><ESC>
nnoremap <leader>qp :cp<CR><ESC>
"== buffer navigation
nnoremap <leader>bf :buffers<CR>:buffer  
nnoremap <leader>bd :bd<CR>
"== press Ctrl-J whenever you want to split a line ==
nnoremap <c-i> i<CR><ESC>
nnoremap <c-j> :join!<CR><ESC>

"== netrw ==
nnoremap <leader>e :Explore<CR>

"== blink cursor ==
:set guicursor=a:blinkon100

"== copy to clipboard
map <F2> "*y

"== search using smartcase
set ignorecase
set smartcase

"== ident
filetype indent on
filetype plugin indent on

"== mouse, The you can press :, select text for the system,
"and press Esc to go back to Vim using the mouse events.
set mouse=nvi

"== enter read only mode when swp file found
autocmd SwapExists * let v:swapchoice = "o"
