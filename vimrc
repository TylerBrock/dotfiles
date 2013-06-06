set nocompatible

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
set history=1000
set encoding=utf-8
set ttyfast
set ambiwidth=double
filetype indent on

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on

"Bundle 'gmarik/vundle'
Bundle "scrooloose/nerdtree"
Bundle "scrooloose/syntastic"
"Bundle "jistr/vim-nerdtree-tabs"
Bundle "tpope/vim-sensible"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-markdown"
Bundle "tpope/vim-cucumber"
Bundle "tpope/vim-haml"
Bundle "tpope/vim-bundler"
Bundle "tpope/vim-surround"
Bundle "tpope/vim-rake"
Bundle "tpope/vim-rbenv"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-bundler"
Bundle "nanotech/jellybeans.vim"
Bundle "kien/ctrlp.vim"
Bundle "majutsushi/tagbar"
Bundle "airblade/vim-gitgutter"
Bundle "Lokaltog/vim-powerline"
Bundle "Shougo/neocomplcache"

colorscheme jellybeans

"NeoComplCache
"let g:neocomplcache_enable_at_startup = 1

"Powerline Theme
"let g:Powerline_colorscheme='solarized256_dark'

"Set an non idiotic undodir
set undodir=/tmp

"GitGutter
let g:gitgutter_sign_column_always = 1
let g:gitgutter_escape_grep = 1
highlight clear SignColumn
set numberwidth=1

"NerdTree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 2 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>
map <Leader>n <plug>NERDTreeTabsToggle<CR>
let NERDTreeMinimalUI = 1
let g:nerdtree_tabs_open_on_console_startup = 1

"Tagbar
autocmd FileType * nested :call tagbar#autoopen(0)
nmap <F8> :TagbarToggle<CR>
let g:tagbar_singleclick = 1
let g:tagbar_compact = 1

"Disable Scrollbars in GVIM
set guioptions-=rL

"Indents
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2

"GUI Size
if has("gui_running")
    set lines=50 columns=160
    set guifont=Inconsolata-dz\ for\ Powerline:h12
endif

"Status Line Stuff
if has('cmdline_info')
    set ruler    " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd  " Show partial commands in status line
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

"RSpec
autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let
highlight def link rubyRspec Function

"let g:Powerline_symbols = 'fancy'
