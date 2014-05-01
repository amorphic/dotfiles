" tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" line numbers
set nu

" colours
set background=dark
set backspace=2

" status line
set laststatus=2
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" plugins
syntax on
filetype indent plugin on

" filetypes
autocmd FileType html set shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango set shiftwidth=2 tabstop=2 softtabstop=2

" pathogen
execute pathogen#infect()
