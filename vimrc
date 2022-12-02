" +++++++++++++++++++
" open all folds  zR
" close all folds  zM
" @see :h fold
" +++++++++++++++++++

" {{{ 基本的な設定
"----------------------------------------------------
"leader
let mapleader=" "

if v:version > 703
  set regexpengine=1
endif

"256色に対応
set t_Co=256

"改行の認識
set fileformats=unix,mac,dos
"音を消す
set vb t_vb=

" バックスペースキーで削除できるものを指定
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start
" バッファを切替えてもundoの効力を失わない
set hidden
" 起動時のメッセージを表示しない
set shortmess+=I

set ruler number
set number
set undodir=~/tmp/vim
" }}}

" {{{ バックアップ関係
"----------------------------------------------------
" バックアップをとらない
set nobackup
" ファイルの上書きの前にバックアップを作る
" (ただし、backup がオンでない限り、バックアップは上書きに成功した後削除される)
set writebackup

" バックアップをとる場合
"set backup
" バックアップファイルを作るディレクトリ
set backupdir=~/tmp/vim
" スワップファイルを作るディレクトリ
set directory=~/tmp/vim
" }}}

" {{{ 検索関係
"----------------------------------------------------
" コマンド、検索パターンを100個まで履歴に残す
set history=100
" 検索の時に大文字小文字を区別しない
set ignorecase
" 検索の時に大文字が含まれている場合は区別して検索する
set smartcase
" 最後まで検索したら先頭に戻る
set wrapscan
" インクリメンタルサーチを使わない
set noincsearch
" }}}

" {{{ 表示関係
"----------------------------------------------------
" タイトルをウインドウ枠に表示する
set title
" 行番号を表示しない
"set nonumber
" ルーラーを表示
set ruler
" タブ文字を CTRL-I で表示し、行末に $ で表示する
set nolist
" 入力中のコマンドをステータスに表示する
set showcmd
" ステータスラインを常に表示
set laststatus=2
" 括弧入力時の対応する括弧を表示
set showmatch
" 対応する括弧の表示時間を2にする
set matchtime=2
" 検索結果文字列のハイライトを有効にする
set hlsearch
" コメント文の色を変更
highlight Comment ctermfg=Darkcyan
" コマンドライン補完を拡張モードにする
set wildmenu

" 入力されているテキストの最大幅
" (行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0
" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap

set lazyredraw

set tabpagemax=60

if &compatible
  set nocompatible               " Be iMproved
endif
" {{{ Indent Settings
"==============================
" オートインデントを有効にする
set autoindent
set smartindent
set cindent


"==============================
"Default tab setting
" ts : タブが対応する空白の数
" sts : タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
" sw : インデントの各段階に使われる空白の数
" et : タブにスペースを使う
"==============================
set sw=2 sts=2 ts=2 et

" }}}

" {{{ 国際化関係
"----------------------------------------------------
" 文字コードの設定
" Vimが内部処理に使用するエンコーディング
set encoding=utf-8
" 端末のエンコーディング
set termencoding=utf-8
" 現在開いているファイルのエンコーディング
set fileencoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,sjis
" }}}

" for installing vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'thinca/vim-quickrun'
Plug 'vim-scripts/surround.vim'
Plug 'jimsei/winresizer'
Plug 'tomasr/molokai'
Plug 'bling/vim-airline'
Plug 'cespare/vim-toml'
Plug 'kannokanno/previm'
Plug 'Shougo/context_filetype.vim'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'scrooloose/nerdtree'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'aklt/plantuml-syntax'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'majutsushi/tagbar'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
Plug 'nelsyeung/twig.vim', { 'for': 'twig' }
Plug 'keith/rspec.vim', { 'for': 'ruby.rspec' }
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

call plug#end()

" 各種設定の読み込み
call map(sort(split(globpath(&runtimepath, '_config/*.vim'))), {->[execute('exec "so" v:val')]})
