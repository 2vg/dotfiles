"***********************
" Modfied by @2vg
" last test env @Vim 8.0
"***********************

"***********************
" Basic
"***********************

"-----------------------
" check compatible
"-----------------------
if &compatible
  set nocompatible
endif

"-----------------------
" encode
"-----------------------
set encoding=utf-8
scriptencoding utf-8

set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double

"-----------------------
" indent
"-----------------------
set expandtab
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set shiftwidth=2

"-----------------------
" search setting
"-----------------------
set incsearch
set ignorecase
set smartcase
set hlsearch
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"-----------------------
" Key, line Setting
"-----------------------
set whichwrap=b,s,h,l,<,>,[,],~
set number
set cursorline

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
vnoremap j gj
vnoremap k gk
vnoremap gj j
vnoremap gk k
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

set backspace=indent,eol,start

map <Space>n :NERDTreeToggle<CR>

"-----------------------
" Tab
"-----------------------
set showmatch
source $VIMRUNTIME/macros/matchit.vim
set wildmenu
set history=5000
set showtabline=2

"-----------------------
" use mouse
"-----------------------
if has('mouse')
  set mouse=a
  if has('mouse_sgr')
    set ttymouse=sgr
  elseif v:version > 703 || v:version is 703 && has('patch632')
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  endif
endif

"-----------------------
" Color
"-----------------------
if &term =~ "xterm"
  let &t_SI .= "\e[?2004h"
  let &t_EI .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

set t_Co=256

"-----------------------
" shell
"-----------------------
"set shell=/bin/sh

"***********************
" Dein
"***********************

"-----------------------
" if not installed, will auto install.
"-----------------------
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
    execute 'set runtimepath^=' . s:dein_repo_dir
endif

"-----------------------
" Setting
"-----------------------
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:plugin_dir    = expand('~/.vim/plugin')
  let s:toml      = g:plugin_dir . '/dein.toml'
  let s:lazy_toml = g:plugin_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

"-----------------------
" Solarized
"-----------------------
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized