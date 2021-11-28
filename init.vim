syntax on
"== show relative line number
set number relativenumber
"== highlight the word at cursor in obvious way
set termguicolors
"== expand tab to space
set expandtab
set shiftwidth=4

if exists('g:vscode')

else 

call plug#begin()

"== vim-startify
Plug 'mhinz/vim-startify'

"== autosave
Plug '907th/vim-auto-save'

"== ranger.vim
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'

"== vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

"== nerdcommenter
Plug 'preservim/nerdcommenter'

"== autopair
Plug 'chun-yang/auto-pairs'

"== tabular
Plug 'godlygeek/tabular'

"== markdown
Plug 'tpope/vim-markdown'
"== markdown-preview
Plug 'JamshedVesuna/vim-markdown-preview'
"== open-browser
Plug 'tyru/open-browser.vim'

"== dash
Plug 'rizzatti/dash.vim'

"== telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Plug plantuml-syntax
Plug 'aklt/plantuml-syntax'

"== sneak
Plug 'justinmk/vim-sneak'

"== file local history
Plug 'dinhhuy258/vim-local-history', {'branch': 'master', 'do': ':UpdateRemotePlugins'}

"== coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"== vimspector
Plug 'puremourning/vimspector'

"== which key
Plug 'folke/which-key.nvim'

"== ctrlspace
Plug 'vim-ctrlspace/vim-ctrlspace'

"== unimpaired
Plug 'tpope/vim-unimpaired'

"== surround
Plug 'tpope/vim-surround'

call plug#end()

"== autosave.vim ==
source ~/.config/nvim/autosave.vim

"== vim-airline.vim ==
source ~/.config/nvim/vim-airline.vim

"== ranger.vim ==
source ~/.config/nvim/ranger.vim

"== nerdcommenter ==
source ~/.config/nvim/nerdcommenter.vim

"== dash.vim ==
source ~/.config/nvim/dash.vim

"== telescope.vim ==
source ~/.config/nvim/telescope.vim

"== treesitter ==
"source ~/.config/nvim/treesitter.vim

"== sneak ==
source ~/.config/nvim/sneak.vim

"== mundo ==
source ~/.config/nvim/localhistory.vim

"== coc ==
source ~/.config/nvim/coc.vim

"==basic vim settings in vim.vim ==
source ~/.config/nvim/vim.vim

"== which key
source ~/.config/nvim/which_key.vim

"== ctrlspace
source ~/.config/nvim/vim-ctrlspace.vim

"== vimspector
source ~/.config/nvim/vimspector.vim

"== quickfix
source ~/.config/nvim/quick_fix.vim

endif

