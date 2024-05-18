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

set smartcase

call plug#begin()

"== vim-startify
Plug 'mhinz/vim-startify'

"== autosave
Plug '907th/vim-auto-save'

"== keep the window open when close buffer
Plug 'rbgrouleff/bclose.vim'

"== vim-airline
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

"== lualine for status line
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
"== bufferline for showing tabs
Plug 'akinsho/bufferline.nvim'

"== nerdcommenter
Plug 'preservim/nerdcommenter'

"== autopair
Plug 'jiangmiao/auto-pairs'

"== tabular
Plug 'godlygeek/tabular'

"== open-browser
"Plug 'tyru/open-browser.vim'

"== dash
"Plug 'rizzatti/dash.vim'

"== lsp signature, disabled since it not work under coc.vim
"lug 'ray-x/lsp_signature.nvim'

"Plug plantuml-syntax
"Plug 'aklt/plantuml-syntax'

"== sneak
"Plug 'justinmk/vim-sneak'

"== hop.vim
Plug 'phaazon/hop.nvim'

"== file local history
Plug 'mbbill/undotree'

"== neoformat -- Don't use neoformat, it didn't honor clang-format
"--style=file
"Plug 'sbdchd/neoformat'

"== nvim-lint
Plug 'mfussenegger/nvim-lint'

"== which key
Plug 'folke/which-key.nvim'

"== grammer check
Plug 'rhysd/vim-grammarous'

"== editorconfig
Plug 'editorconfig/editorconfig-vim'

"== fugitive
Plug 'tpope/vim-fugitive'

"== lazygit
Plug 'kdheepak/lazygit.nvim'

"== telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'

"== auto-session
Plug 'rmagatti/auto-session'

"== oil.nvim, mange files in manner of buffer
Plug 'stevearc/oil.nvim'

call plug#end()

"== autosave.vim ==
source ~/AppData/Local/nvim/autosave.vim

"== lualine
source ~/AppData/Local/nvim/lualine.vim

"== bufferline
source ~/AppData/Local/nvim/bufferline.vim

"== telescope.vim ==
source ~/AppData/Local/nvim/telescope.vim

"== hop.nvim ==
source ~/AppData/Local/nvim/hop.vim

"==basic vim settings in vim.vim ==
source ~/AppData/Local/nvim/vim.vim

"== which key
source ~/AppData/Local/nvim/which_key.vim

"== vim-startify
source ~/AppData/Local/nvim/startify.vim

"== nvim-lint
source ~/AppData/Local/nvim/nvim-lint.vim

"== grammerous
source ~/AppData/Local/nvim/vim-grammarous.vim

"== undotree
source ~/AppData/Local/nvim/undotree.vim

"== lazygit
source ~/AppData/Local/nvim/lazygit.vim

"== auto-session
source ~/AppData/Local/nvim/auto-session.vim

"== oil
source ~/AppData/Local/nvim/oil.vim
