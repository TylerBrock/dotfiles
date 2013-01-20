set nocompatible

colorscheme jellybeans
set linespace=0
set backspace=indent,eol,start
set nu
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
set listchars=tab:,.,trail:.,extends:#,nbsp:.
set expandtab

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on

Bundle "scrooloose/nerdtree"

"NerdTree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>

"Disable Scrollbars in GVIM
set guioptions-=rL

"Indents
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 softtabstop=4

"GUI Size
if has("gui_running") | set lines=40 columns=120 | endif
