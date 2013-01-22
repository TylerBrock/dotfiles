set nocompatible

"python import sys; sys.path.append("/Library/Python/2.7/site-packages/");
"python from powerline import source_plugin; source_plugin();

colorscheme jellybeans
syntax on
set linespace=0
set backspace=indent,eol,start
set nu
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
set list
set listchars=tab:,.,trail:.,extends:#,nbsp:.
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set smartindent
set autoindent
set copyindent
set showmode
set spell
set history=1000
filetype indent on

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on

Bundle "scrooloose/nerdtree"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-markdown"
Bundle "tpope/vim-cucumber"
Bundle "tpope/vim-haml"
Bundle "tpope/vim-bundler"
Bundle "tpope/vim-surround"
Bundle "tpope/vim-rake"
Bundle "tpope/vim-rails"
"Bundle "Lokaltog/vim-powerline"

"NerdTree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-a> :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1

"Disable Scrollbars in GVIM
set guioptions-=rL

"Indents
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2

"GUI Size
if has("gui_running")
    set lines=60 columns=120
endif

if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
endif

if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif
