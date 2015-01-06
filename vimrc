" vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
call vundle#end() 
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" line numbers
set number

" paste
set paste

" colours
set t_Co=256
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

" line/column highlight
set cursorline
set cursorcolumn 
highlight CursorColumn ctermbg=8
highlight CursorLine ctermbg=8 

" jump editor lines rather than wrapped lines
nnoremap j gj
nnoremap k gk

" plugins
syntax on
filetype indent plugin on

" correct filetypes
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" 2-space indent
let twospacetypes = ['html', 'htmldjango', 'javascript']
autocmd FileType * if index(twospacetypes, &ft) >= 0 | setlocal shiftwidth=2 tabstop=2 softtabstop=2

" 80 char limit
let eightychartypes = ['python', 'javascript', 'ruby']
highlight OverLength ctermbg=red ctermfg=white guibg=red
autocmd FileType * if index(eightychartypes, &ft) >= 0 | match OverLength /\%80v.\+/
