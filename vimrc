set nocompatible
filetype plugin indent on
syntax on

call plug#begin('~/.vim/plugged')
Plug 'pangloss/vim-javascript', { 'for': 'js' }
Plug 'mxw/vim-jsx', { 'for': 'jsx' }
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'mileszs/ack.vim'
Plug 'itchyny/lightline.vim'
Plug 'trevordmiller/nova-vim'
Plug 'hashivim/vim-terraform'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
call plug#end()

set linespace=0
set backspace=indent,eol,start
set nu
set showmatch
set incsearch
set nohlsearch
set ignorecase
set smartcase
set list
set listchars=tab:\ \ ,trail:.,extends:#,nbsp:.
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set numberwidth=1
set smarttab
set smartindent
set autoindent
set copyindent
set showmode
set signcolumn=yes
set laststatus=2
set history=10000
set encoding=utf-8
set ttyfast
set t_Co=256
set background=dark

"GUI / Non-GUI settings
if has("gui_running")
    colorscheme nova
    highlight Directory guifg=#88AAEE
    highlight SignColumn ctermbg=8
    highlight clear SignColumn
    "autocmd ColorScheme * highlight clear SignColumn
    set lines=50 columns=160
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar

    if has("gui_gtk2")
        set guifont=Source\ Code\ Pro\ for\ Powerline\ 10
    elseif has("gui_macvim")
        set guifont=Inconsolata\-DZ\ for\ Powerline:h12
    endif
else
    colorscheme Tomorrow-Night
    set background=dark
endif

"Lightline
let g:lightline = { 'colorscheme': 'jellybeans' }

"GitGutter
let g:gitgutter_escape_grep = 1
let g:gitgutter_realtime = 1
highlight clear SignColumn

"JavaScript
let g:javascript_plugin_flow = 1

"Ack + Ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

"Ale
let g:ale_linters = { 'javascript': ['eslint'] }
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1

"Ctrl-P
let g:ctrlp_custom_ignore = 'build\|DS_Store\|git\|docs\|node_modules'

"Indents
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4
