
syntax on

"== show relative line number
set number relativenumber
"== highlight the word at cursor in obvious way
set termguicolors
"== expand tab to space
"set expandtab
"set shiftwidth=4
"== mouse
set mouse=a

call plug#begin()

"== copilot
Plug 'github/copilot.vim'

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
Plug 'jiangmiao/auto-pairs'

"== tabular
Plug 'godlygeek/tabular'

"== markdown
Plug 'tpope/vim-markdown'
"== markdown-preview
Plug 'JamshedVesuna/vim-markdown-preview', { 'do': { -> mkdp#util#install() }}
"== open-browser
Plug 'tyru/open-browser.vim'

"== dash
Plug 'rizzatti/dash.vim'

"== treesitter, disabled since it's not work under coc.vim
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter-context'
"Plug 'nvim-treesitter/playground'

"== lsp signature, disabled since it not work under coc.vim
Plug 'ray-x/lsp_signature.nvim'

"Plug plantuml-syntax
Plug 'aklt/plantuml-syntax'

"== sneak
"Plug 'justinmk/vim-sneak'

"== hop.vim
Plug 'phaazon/hop.nvim'

"== file local history
Plug 'mbbill/undotree'

"== vim-clang-format
Plug 'rhysd/vim-clang-format'

"== neoformat -- Don't use neoformat, it didn't honor clang-format
"--style=file
"Plug 'sbdchd/neoformat'

"== nvim-lint
Plug 'mfussenegger/nvim-lint'

"== rust-tools
" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'
" Completion framework
Plug 'hrsh7th/nvim-cmp'
" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
" Other usefull completion sources
Plug 'hrsh7th/cmp-path'
" Fuzzy finder
" Optional
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" Debug -- don't use dap, it's kind of premature

"== lsp status - not work!
"Plug 'nvim-lua/lsp-status.nvim'

" vimspector
Plug 'puremourning/vimspector'

"== rust.vim
"Plug 'rust-lang/rust.vim'

"== which key
Plug 'folke/which-key.nvim'

"== vista function/variable outline
Plug 'liuchengxu/vista.vim'

"== ctrlspace
"Plug 'vim-ctrlspace/vim-ctrlspace'

"== unimpaired
"Plug 'tpope/vim-unimpaired'

"== tasks
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

"== markdown-preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

"== grammer check
Plug 'rhysd/vim-grammarous'

"== editorconfig
Plug 'editorconfig/editorconfig-vim'

"== vim-diffchanges
Plug 'jmcantrell/vim-diffchanges'

"== fugitive
Plug 'tpope/vim-fugitive'

"== lazygit
Plug 'kdheepak/lazygit.nvim'

"== telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

call plug#end()

"==copilot==
source ~/.config/nvim/copilot.vim

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
source ~/.config/nvim/treesitter.vim

"== sneak ==
"source ~/.config/nvim/sneak.vim

"== hop.nvim ==
source ~/.config/nvim/hop.vim

"== nvim-lspconfig
source ~/.config/nvim/lspconfig.vim

"== nvim-cmp.vim
source ~/.config/nvim/nvim-cmp.vim

"==basic vim settings in vim.vim ==
source ~/.config/nvim/vim.vim

"== which key
source ~/.config/nvim/which_key.vim

"== vista
source ~/.config/nvim/vista.vim


"== vimspector
source ~/.config/nvim/vimspector.vim

"== vim-startify
source ~/.config/nvim/startify.vim

"== asynctasks
source ~/.config/nvim/asynctasks.vim

"== nvim-lint
source ~/.config/nvim/nvim-lint.vim

"== vim-clang-format
source ~/.config/nvim/vim-clang-format.vim

"== neoformat
"source ~/.config/nvim/neoformat.vim

"== grammerous
source ~/.config/nvim/vim-grammarous.vim

"== undotree
source ~/.config/nvim/undotree.vim

"== lazygit
source ~/.config/nvim/lazygit.vim
