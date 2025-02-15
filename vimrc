" vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tmhedberg/SimpylFold'
Plugin 'Yggdroot/indentLine'
Plugin 'nvie/vim-flake8'
Plugin 'nono/vim-handlebars'
Plugin 'jaxbot/semantic-highlight.vim'
Plugin 'posva/vim-vue'
Plugin 'hashivim/vim-terraform.git'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'davidhalter/jedi-vim'
Plugin 'github/copilot.vim'

call vundle#end() 
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" line numbers
set number

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
autocmd BufNewFile,BufReadPost *.hbs set filetype=handlebars

" 2-space indent
let twospacetypes = ['html', 'htmldjango', 'javascript', 'handlebars', 'ruby', 'json', 'vue', 'yaml', 'terraform', 'typescript']
autocmd FileType * if index(twospacetypes, &ft) >= 0 | setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" 80 char limit
let eightychartypes = ['python', 'javascript', 'ruby']
highlight OverLength ctermbg=red ctermfg=white guibg=red
autocmd FileType * if index(eightychartypes, &ft) >= 0 | match OverLength /\%80v.\+/

" Map F3 to flake8 check
autocmd FileType python map <buffer> <F3> :call Flake8()<CR>

" Save with sudo
cmap w!! w !sudo tee % >/dev/null

" Disable json quote concealing
set conceallevel=0

" Stop vim from renaming old file and writing new as it breaks webpack watcher
set backupcopy=yes

" tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Open NERDTree automatically if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close NERDTree automatically if it is the last tab open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

" NERDTree toggle
map <C-n> :NERDTreeToggle<CR>

" IndentLines toggle
map <F5> :IndentLinesToggle<CR>

" Increased update time for vim-gitgutter
set updatetime=100

" Refine search
set hlsearch    " highlight all search results
set ignorecase  " do case insensitive search 
set incsearch   " show incremental search results as you type
