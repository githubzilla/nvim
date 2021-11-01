set makeprg=cargo

" Command Make will call make and then cwindow whic
" opens a 3 line error window if any errors are found.
" If no errors, it closes any open cwindow.
command -nargs=* Make make <args>

"map Make 
map <Leader>cb :Make buid<CR>

" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
"autocmd QuickFixCmdPost [^l]* nested cwindow
"autocmd QuickFixCmdPost    l* nested lwindow
