" vim互換の動作を無効化する
if &compatible
  set nocompatible
endif

" vimが使うpython3の設定
let g:python3_host_prog = expand('~/miniconda3/bin/python3')

" dein
if has("mac")  " macOSで作業する場合
  let s:dein_cache_dir = $XDG_CACHE_HOME . '/dein'
  let s:dein_config_dir = $XDG_CONFIG_HOME . '/nvim/dein'
elseif has("unix")  " サーバーで作業する場合
  let s:dein_cache_dir = $HOME . '/.cache/dein'
  let s:dein_config_dir = $HOME . '/.config/dein'
endif
let s:dein_repo_dir = s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'
let s:toml = s:dein_config_dir . '/toml/dein.toml'
let s:lazy_toml = s:dein_config_dir . '/toml/dein_lazy.toml'
exe 'set runtimepath+=' . s:dein_repo_dir
if dein#load_state(s:dein_cache_dir)
  call dein#begin(s:dein_cache_dir)
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  if dein#check_install()
    call dein#install()
  endif
  call dein#check_clean()
  call dein#end()
  call dein#save_state()
endif

" 基本設定
syntax on
filetype plugin indent on

set background=dark
if has("mac")
  colorscheme molokai
elseif has("unix")
  colorscheme slate
endif

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,enc-jp,sjis,iso-2022,cp932
set fileformats=unix,dos,mac  " 改行コードの指定 (lf, crlf, cr)

set ambiwidth=double " ◯や…に全角スペースが割り当てられるようにする
set backspace=indent,eol,start
set formatoptions+=m
set list
set listchars=tab:>-,extends:<,trail:-
set hidden

set wildmenu
set showmatch

set wrapscan
set ignorecase
set smartcase
set incsearch
set hlsearch

set autoindent
set smartindent
set expandtab
set smarttab
set number

set tabstop=2
set shiftwidth=2
set softtabstop=2

set laststatus=2
set scrolloff=5
set noswapfile
set nobackup
set undodir=~/.vim/undo
set clipboard+=unnamed
set whichwrap=b,s,h,l,<,>,[,],~
set guifont=Ricty\ 11
if has("mac")
  set imdisable
endif

highlight ZenkakuSpace cterm=underline ctermfg=lightblue
match ZenkakuSpace /　/

" insert mode時の<C-space>で入力されるnullを無効化
imap <Nul> <Nop>

noremap j gj
noremap k gk
noremap gj j
noremap gk k

nnoremap ,.  :<C-u>edit $MYVIMRC<Enter>
nnoremap ,s. :<C-u>source $MYVIMRC<Enter>

nnoremap gc `[V`]
vnoremap gc :<C-u>normal gc<Enter>
onoremap gc :<C-u>normal gc<Enter>

" au設定
augroup AutoCommands
  au!
  au BufRead,BufNewFile *.md set ft=markdown
  au BufRead,BufNewFile *.cgi  set ft=perl
  au BufRead,BufNewFile *.psgi set ft=perl
  au BufRead,BufNewFile *.xsh set ft=xonsh
  au BufRead,BufNewFile *.md,*.js,*.py,*.php,*xsh,.xonshrc setlocal tabstop=4 softtabstop=4 shiftwidth=4
  au BufRead,BufNewFile *.go setlocal noexpandtab
augroup end
