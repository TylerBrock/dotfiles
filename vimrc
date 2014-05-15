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
set softtabstop=4
set smarttab
set smartindent
set autoindent
set copyindent
set showmode
set history=1000
set encoding=utf-8
set ttyfast

"Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/vundle'
Bundle "scrooloose/nerdtree"
"Bundle "scrooloose/syntastic"
Bundle "scrooloose/nerdcommenter"
Bundle "jistr/vim-nerdtree-tabs"
Bundle "tpope/vim-sensible"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-markdown"
Bundle "tpope/vim-cucumber"
Bundle "tpope/vim-haml"
Bundle "tpope/vim-surround"
Bundle "tpope/vim-rake"
Bundle "tpope/vim-rbenv"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-bundler"
Bundle "nanotech/jellybeans.vim"
Bundle "cschlueter/vim-wombat"
Bundle "d11wtq/tomorrow-theme-vim"
Bundle "kien/ctrlp.vim"
Bundle "majutsushi/tagbar"
"Bundle "airblade/vim-gitgutter"
"Bundle "Shougo/neocomplcache"
Bundle "Valloric/YouCompleteMe"
Bundle "lepture/vim-jinja"
Bundle "wting/rust.vim"
"Bundle "klen/python-mode"
"Bundle "skwp/vim-rspec"
Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle "othree/javascript-libraries-syntax.vim"
Bundle "vim-scripts/a.vim"
Bundle "vim-scripts/scons.vim"
Bundle "bling/vim-airline"
Bundle "altercation/vim-colors-solarized"
Bundle "rking/ag.vim"
"Bundle "jalcine/cmake.vim"
Bundle "Raimondi/delimitMate"

call vundle#end()
filetype plugin indent on

syntax on
"colorscheme Tomorrow-Night
"colorscheme wombat
"colorscheme jellybeans

let mapleader=","
set cmdheight=2
set clipboard=unnamed
set mouse=a
"setlocal spell spelllang=en_us
set mousemodel=popup
"set spell

"GUI / Non-GUI settings
if has("gui_running")
    colorscheme solarized
    set background=dark
    highlight Directory guifg=#88AAEE
    highlight SignColumn ctermbg=8
    highlight clear SignColumn
    "autocmd ColorScheme * highlight clear SignColumn
    set lines=50 columns=160

    if has("gui_gtk2")
        set guifont=Source\ Code\ Pro\ for\ Powerline\ 10
    elseif has("gui_macvim")
        set guifont=Inconsolata\-DZ\ for\ Powerline:h12
    endif
else
    colorscheme Tomorrow-Night
endif

"CMake
let g:cmake_build_dirs = [ "build" ]
nmap <Leader>b :CMakeBuild<CR>
nmap <Leader>t :CMakeTarget test<CR>
nmap <Leader>c :CMakeCreateBuild build<CR>

"YouCompleteMe
let g:ycm_confirm_extra_conf = 0
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

"NeoComplCache
"let g:neocomplcache_enable_at_startup = 1

"Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'
"let g:airline_theme='solarized'

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
"let g:gitgutter_sign_column_always = 1
let g:gitgutter_escape_grep = 1
"highlight clear SignColumn
"highlight SignColumn guibg=DarkGreen
"highlight SignColumn ctermbg=DarkGreen
set numberwidth=1

"NerdTree
"autocmd vimenter * if !argc() | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>
map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <Leader>m :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1
let g:nerdtree_tabs_open_on_gui_startup = 0

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
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

"RSpec
autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let
highlight def link rubyRspec Function
let g:rspec_command = "Dispatch rspec {spec}"
"map <Leader>t :call RunCurrentSpecFile()<CR>
"map <Leader>s :call RunNearestSpec()<CR>
"map <Leader>l :call RunLastSpec()<CR>
"map <Leader>a :call RunAllSpecs()<CR>

"Python
let g:pymode_virtualenv = 1
let g:pymode_folding = 0
let g:pymode_rope_guess_project = 0
let g:pymode_rope_auto_project = 0
let g:pymode_rope_lookup_project = 0
let NERDTreeIgnore = ['\.pyc$']

" Syntastic
let g:syntastic_c_include_dirs=['/usr/local/include/libbson-1.0']
let g:syntastic_cpp_include_dirs=['/home/tbrock/Code/mongo/src','/home/tbrock/Code/mongo/build/cached']
"let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_c_checker = "clang"
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_c_no_include_search = 1
let g:syntastic_cpp_no_include_search = 1
let g:syntastic_cpp_errorformat =
            \ '%-G%f:%s:,'.
            \ '%f:%l:%c: %trror: %m,'.
            \ '%f:%l:%c: %tarning: %m,'.
            \ '%I%f:%l:%c: note: %m,'.
            \ '%f:%l:%c: %m,'.
            \ '%f:%l: %trror: %m,'.
            \ '%f:%l: %tarning: %m,'.
            \ '%I%f:%l: note: %m,'.
            \ '%f:%l: %m,'.
            \ '%I%m'


"Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Scons
au BufNewFile,BufRead SCons* set filetype=scons

" C++
command! SconsTest execute "!scons -j8 --use-system-boost test"
nnoremap <leader>t :SconsTest<CR>

" Javascript Frameworks
let g:used_javascript_libs = 'angularjs,underscore,backbone'
