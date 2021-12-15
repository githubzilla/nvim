set nocompatible
set hidden
set encoding=utf-8

let g:CtrlSpaceDefaultMappingKey = "<C-space> "

if has("gui_running")
    " Settings for MacVim and Inconsolata font
    let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
endif

if executable("ag")
        let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

let g:CtrlSpaceFileEngine = "file_engine_darwin_amd64"

" disable workspace
let g:CtrlSpaceLoadLastWorkspaceOnStart = 0
let g:CtrlSpaceSaveWorkspaceOnSwitch = 0
let g:CtrlSpaceSaveWorkspaceOnExit = 0
