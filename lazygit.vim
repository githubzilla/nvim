let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:g:lazygit_floating_window_border_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed

"Use \gg load lazygit
nnoremap <silent> <leader>gg :LazyGit<CR>
"Change lazygit project root when buffe change
autocmd BufEnter * :lua require('lazygit.utils').project_root_dir()
