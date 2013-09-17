set nocompatible

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

"Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

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
Bundle "lepture/vim-jinja"
Bundle "wting/rust.vim"
Bundle "klen/python-mode"

filetype plugin indent on

syntax on
colorscheme jellybeans

"NeoComplCache
"let g:neocomplcache_enable_at_startup = 1

"Powerline Theme
"let g:Powerline_colorscheme='solarized256_dark'

" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

"GitGutter
let g:gitgutter_sign_column_always = 1
let g:gitgutter_escape_grep = 1
highlight clear SignColumn
set numberwidth=1

"Bluedirs
highlight Directory guifg=#88AAEE

"NerdTree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>
map <Leader>n <plug>NERDTreeTabsToggle<CR>
let NERDTreeMinimalUI = 1
"let g:nerdtree_tabs_open_on_console_startup = 1

"Tagbar
"autocmd FileType * nested :call tagbar#autoopen(0)
nmap <F8> :TagbarToggle<CR>
let g:tagbar_singleclick = 1
let g:tagbar_compact = 1

"Disable Scrollbars in GVIM
set guioptions-=rL

"Indents
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4

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
let g:Powerline_symbols = 'fancy'

"RSpec
autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let
highlight def link rubyRspec Function

"Python
let g:pymode_virtualenv = 1
let g:pymode_folding = 0
let NERDTreeIgnore = ['\.pyc$']

" C++11 Mode for Syntastic
let g:syntastic_cpp_compiler_options = ' -std=c++11'

" C++ shit
autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r.o').' && ./'.shellescape('%:r.o')<CR>
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++-4.9 -std=c++11 '.shellescape('%').' -o '.shellescape('%:r.o').' && ./'.shellescape('%:r.o')<CR>

"Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>
