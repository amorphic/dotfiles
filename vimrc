" pathogen
""execute pathogen#infect()

" tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" line numbers
set number
""autocmd FocusLost * :set number
""autocmd InsertEnter * :set number
""autocmd InsertLeave * :set relativenumber
""autocmd CursorMoved * :set relativenumber

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

" plugins
syntax on
filetype indent plugin on

" filetypes
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

" line/column highlight
set cursorline
set cursorcolumn 
highlight CursorColumn ctermbg=8
highlight CursorLine ctermbg=8 

" highlight > 80 chars "
highlight OverLength ctermbg=red ctermfg=white guibg=red
match OverLength /\%80v.\+/
