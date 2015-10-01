"Vim-Plug
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdcommenter'
Plug 'd11wtq/tomorrow-theme-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe'
Plug 'marijnh/tern_for_vim'
Plug 'vim-scripts/a.vim', { 'for': ['c', 'cpp'] }
Plug 'rking/ag.vim'
Plug 'fatih/vim-go', { 'for': ['go'] }
Plug 'mxw/vim-jsx'
Plug 'jdkanani/vim-material-theme'
Plug 'justbrettjones/vim-swigjs'
Plug 'gilgigilgil/anderson.vim'
call plug#end()

set nocompatible
filetype plugin indent on

set linespace=0
set backspace=indent,eol,start
set nu
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
set list
set listchars=tab:\ \ ,trail:.,extends:#,nbsp:.
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set smartindent
set autoindent
set copyindent
set showmode
set laststatus=2
set history=10000
set encoding=utf-8
set ttyfast
set t_Co=256

syntax on
"colorscheme anderson
colorscheme Tomorrow-Night
"colorscheme wombat
"colorscheme jellybeans

let mapleader=","
set clipboard=unnamed
set mouse=a
"setlocal spell spelllang=en_us
set mousemodel=popup
"set spell

"GUI / Non-GUI settings
if has("gui_running")
    "colorscheme solarized
    colorscheme anderson
    set background=dark
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
    "colorscheme Tomorrow-Night
    set background=dark
endif

"Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'
let g:airline#extensions#whitespace#enabled=0
"let g:airline_theme='solarized'

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

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
let g:gitgutter_realtime = 1
highlight clear SignColumn
"highlight SignColumn guibg=DarkGreen
"highlight SignColumn ctermbg=DarkGreen
set numberwidth=1

"NerdTree
map <C-n> :NERDTreeToggle<CR>
map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <Leader>m :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_focus_on_files = 1

"Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_singleclick = 1
let g:tagbar_compact = 1

"Disable Scrollbars in GVIM
set guioptions-=rL

"Indents
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

"Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

"Ctrl-p
let g:ctrlp_custom_ignore = 'build\|DS_Store\|git\|docs\|node_modules'

" No highlight
nmap <silent> <leader>/ :set invhlsearch<CR>
