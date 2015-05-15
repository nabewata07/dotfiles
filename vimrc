"----------------------------------------------------
" 基本的な設定
"----------------------------------------------------
"leader
let mapleader=" "
"vimでbackspaceが効かないときの設定
"  は制御コードDELete
noremap  
noremap!  

"256色に対応
set t_Co=256

"viと同期しない設定
set nocompatible
"改行の認識
set fileformats=unix,dos,mac
"音を消す
set vb t_vb=

" バックスペースキーで削除できるものを指定
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

" jkでEsc
inoremap jk <Esc>

"----------------------------------------------------
" バックアップ関係
"----------------------------------------------------
" バックアップをとらない
set nobackup
" ファイルの上書きの前にバックアップを作る
" (ただし、backup がオンでない限り、バックアップは上書きに成功した後削除される)
set writebackup

" バックアップをとる場合
"set backup
" バックアップファイルを作るディレクトリ
"set backupdir=~/backup
" スワップファイルを作るディレクトリ
"set directory=~/swap



"----------------------------------------------------
" 検索関係
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




"----------------------------------------------------
" 表示関係
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
" シンタックスハイライトを有効にする
syntax on
" 検索結果文字列のハイライトを有効にする
set hlsearch
" Esc Esc でハイライトOFF
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" コメント文の色を変更
highlight Comment ctermfg=Darkcyan
" コマンドライン補完を拡張モードにする
set wildmenu

" 入力されているテキストの最大幅
" (行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0
" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap

" 全角スペースの表示
"highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
"match ZenkakuSpace /　/

augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=darkred ctermbg=darkred
  autocmd VimEnter,WinEnter * match TrailingSpaces /\(\s\+$\|　\)/
augroup END

autocmd ColorScheme * hi LineNr ctermfg=yellow
autocmd ColorScheme * hi DiffAdd term=bold cterm=bold ctermfg=254 ctermbg=237 gui=bold
autocmd ColorScheme * hi DiffChange ctermfg=172 ctermbg=237
autocmd ColorScheme * hi DiffDelete ctermfg=167 ctermbg=234
autocmd ColorScheme * hi SpellBad ctermfg=white ctermbg=red

"colorscheme BlackSea
colorscheme Tomorrow-Night-Bright

"" ステータスラインに表示する情報の指定
"set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=
"" ステータスラインの色
""highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none
"highlight statusline   term=NONE cterm=NONE guifg=red ctermfg=yellow ctermbg=red

set lz

"==============================
" Indent Settings
"==============================
" オートインデントを有効にする
set autoindent
set smartindent
set cindent
"Default setting
set tabstop=4 shiftwidth=4 softtabstop=0 expandtab


"==============================
" setting in each file type
" ts : タブが対応する空白の数
" sts : タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
" sw : インデントの各段階に使われる空白の数
" et : タブにスペースを使う
"==============================

if has("autocmd")
    filetype plugin on
    filetype indent on

    autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
    autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 et
    autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
    autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
    autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
    autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
    autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
    autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 et
    autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
    autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
    autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
    autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
    autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
    autocmd FileType python     setlocal sw=4 sts=4 ts=4 et textwidth=80 cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
    autocmd FileType ruby.rspec setlocal sw=2 sts=2 ts=2 et
    autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
    autocmd FileType sh         setlocal sw=2 sts=2 ts=2 et
    autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
    autocmd FileType vb         setlocal sw=4 sts=4 ts=4 et
    autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
    autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
    autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
    autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
    autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
    autocmd FileType zsh        setlocal sw=2 sts=2 ts=2 et
    autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
    autocmd FileType manifest   setlocal sw=2 sts=2 ts=2 et
endif

"==============================

"----------------------------------------------------
" 国際化関係
"----------------------------------------------------
" 文字コードの設定
" fileencodingsの設定ではencodingの値を一番最後に記述する
" Vimが内部処理に使用するエンコーディング
set encoding=utf-8
" 端末のエンコーディング
set termencoding=utf-8
" 現在開いているファイルのエンコーディング
set fileencoding=utf-8
"set fileencodings=ucs-bom,euc-jp,cp932,iso-2022-jp
"set fileencodings+=,ucs-2le,ucs-2,utf-8

"----------------------------------------------------
" ctags
"----------------------------------------------------
" 同じ関数名があった場合、どれに飛ぶか選択できるようにする
nnoremap <C-]> g<C-]>

"taglist
let Tlist_Ctags_Cmd = "/usr/bin/ctags"    "ctagsのパス
let Tlist_Show_One_File = 1               "現在編集中のソースのタグしか表示しない
let Tlist_Exit_OnlyWindow = 1             "taglistのウィンドーが最後のウィンドーならばVimを閉じる
let Tlist_Use_Right_Window = 1            "taglistを右側で開く
" 現在のディレクトリから再帰的に上層のtagsファイルを探す

"----------------------------------------------------
" LookupFile
"----------------------------------------------------
nnoremap <silent> <F12> :LookupFile<CR>
nmap <unique> <silent> <C-S> :LUBufs ^.*<CR>
let g:LookupFile_AlwaysAcceptFirst=1
let g:LookupFile_PreserveLastPattern=0
let g:LookupFile_AllowNewFiles=0
inoremap <buffer> <TAB> <C-n>
inoremap <buffer> <S-TAB> <C-p>
"inoremap <buffer> <C-c> <Esc><C-W>q
"nnoremap <buffer> <C-c> <C-W>q
"inoremap <buffer> <C-s> <Esc>:LUPath<CR>
"nnoremap <buffer> <C-s> :LUPath<CR>


"----------------------------------------------------
" オートコマンド
"----------------------------------------------------
if has("autocmd")
    " ファイルタイプ別インデント、プラグインを有効にする
    filetype plugin indent on
    " カーソル位置を記憶する
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
endif

"<TAB>で補完
"" {{{ Autocompletion using the TAB key
" This function determines, wether we are on the start of the line text (then tab indents) or
" " if we want to try autocompletion
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<TAB>"
    else
        if pumvisible()
            return "\<C-N>"
        else
            return "\<C-N>\<C-P>"
        end
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

":autocmd FileType php noremap <F2> :!php -l %<CR>

"smarty シンタックスの設定
au BufRead,BufNewFile *.tpl.* set filetype=smarty
au Filetype smarty exec('set dictionary=$HOME/.vim/syntax/smarty.vim')
au Filetype smarty set complete+=k

"rspec シンタックスの設定
au BufRead,BufNewFile *_spec.rb set filetype=ruby.rspec
au Filetype ruby.rspec hi rspecGroupMethods term=underline ctermfg=110 guifg=#7aa6da

"au Filetype php let g:neocomplcache_enable_at_startup = 0

"----------------------------------------------------
" その他
"----------------------------------------------------
" バッファを切替えてもundoの効力を失わない
set hidden
" 起動時のメッセージを表示しない
set shortmess+=I

set ruler number
set number
" set runtimepath+=$HOME/.vim/pluguin,$HOME/.vim/doc,$HOME/.vim/autoload
"
if &encoding !=# 'utf-8'
    set encoding=japan
    set fileencoding=japan
endif
if has('iconv')
    let s:enc_euc = 'euc-jp'
    let s:enc_jis = 'iso-2022-jp'
    if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'eucjp-ms'
        let s:enc_jis = 'iso-2022-jp-3'
    elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'euc-jisx0213'
        let s:enc_jis = 'iso-2022-jp-3'
    endif
    if &encoding ==# 'utf-8'
        let s:fileencodings_default = &fileencodings
        let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
        let &fileencodings = &fileencodings .','. s:fileencodings_default
        unlet s:fileencodings_default
    else
        let &fileencodings = &fileencodings .','. s:enc_jis
        set fileencodings+=utf-8,ucs-2le,ucs-2
        if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
            set fileencodings+=cp932
            set fileencodings-=euc-jp
            set fileencodings-=euc-jisx0213
            set fileencodings-=eucjp-ms
            let &encoding = s:enc_euc
            let &fileencoding = s:enc_euc
        else
            let &fileencodings = &fileencodings .','. s:enc_euc
        endif
    endif
    unlet s:enc_euc
    unlet s:enc_jis
endif
if has('autocmd')
   function! AU_ReCheck_FENC()
       if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
          let &fileencoding=&encoding
       endif
   endfunction
   autocmd BufReadPost * call AU_ReCheck_FENC()
endif
set fileformats=unix,dos,mac
if exists('&ambiwidth')
    set ambiwidth=double
endif

"svnの時はutf-8に文字コードを設定
autocmd FileType svn :set fileencoding=utf-8


"----------------------------------------------------
" キーマップ割り当てセクション
"----------------------------------------------------
nnoremap <C-n> gt
nnoremap <C-p> gT
nnoremap <F8> :NERDTreeFind<CR>
"nnoremap <C-w>j :<C-w>j<ESC>:NERDTreeFind<CR>
nnoremap <silent> <F9> :NERDTreeToggle<CR>
nnoremap <silent> <F10> :TlistToggle<CR>
nnoremap <silent> <F11> :VCSDiff<CR>
nnoremap <silent> <F2> :VCSLog<CR>
nnoremap <Space>s. :<C-u>source $HOME/.vimrc<CR>

if v:version >= 700
    nnoremap <C-g> :call OpenNewTab()<CR>
    function! OpenNewTab()
        let f = expand("%:p")
        execute ":q"
        execute ":tabnew ".f
    endfunction
endif

" autoclose
inoremap (<CR> ()<Left>
inoremap '<CR> ''<Left>
inoremap "<CR> ""<Left>
inoremap [<CR> []<Left>
inoremap {<CR> {}<Left>
inoremap <<CR> <><Left>


"-----------------------------------------------
"svnでいくつ前のリビジョンかを指定して比較を行なう
"listオプションを指定すれば一覧から選択形式で比較できる
"
"※HEADリビジョンを1としている
"
">>>>>>>>>>>>>>>>>> 使い方 <<<<<<<<<<<<<<<<<
"
"調べたいファイルをアクティブにして
"コマンドモードで下記コマンドを実行する
"
":VCSDiffPast [-list] number
"# [-list] はオプション(省略可)
"# VCSDiff形式で比較
"# number はHEADリビジョンを1としている
"
":VCSVimDiffPast [-list] number
"# [-list] は一覧表示オプション(省略可)
"# VCSVimDiff形式で比較
"# number はHEADリビジョンを1としている
"
"
">>>>>>>>>>>>>>>>>>> 例 <<<<<<<<<<<<<<<<<<<<
"
":VCSDiffPast 1
"#最新バージョンのソースとVCSDiffで比較
"#普通のVCSDiffと同じ
"
":VCSDiffPast 2
"#最新バージョン前のバージョンのソースとVCSDiffで比較
"
":VCSDiffPast -list 20
"#過去、20バージョンのリビジョン番号とコミッタ、日時を
"#リスト形式で表示して、選択されたものと差異をVCSDiffで比較
"
":VCSVimDiffPast 1
"#最新バージョンのソースとVCSVimDiffで比較
"#普通のVCSVimDiffと同じ
"
":VCSVimDiffPast 3
"#最新バージョン前の前のソースとVCSVimDiffで比較
"
":VCSVimDiffPast -list 15
"#過去、15バージョンのリビジョン番号とコミッタ、日時を
"#リスト形式で表示して、選択したものとの差異をVCSDiffで比較
"
"-----------------------------------------------
com! -nargs=* VCSDiffPast call VCSDiffPast(<f-args>)
com! -nargs=* VCSVimDiffPast call VCSVimDiffPast(<f-args>)

function! VCSDiffPast(n,...)
    if a:0 > 0 && a:n == "-list"
        let rev = GetPastRevisionByList(a:1)
    else
        let rev = GetPastRevision(a:n)
    endif
    execute ":VCSDiff ".rev
endfunction

function! VCSVimDiffPast(n,...)
    if a:0 > 0 && a:n == "-list"
        let rev = GetPastRevisionByList(a:1)
    else
        let rev = GetPastRevision(a:n)
    endif
    execute ":VCSVimDiff ".rev
endfunction

function! GetPastRevision(n)
    let f = expand("%:p")
    let rev = system("svn log -q --limit ".a:n." ".f." |awk '$2{print $1}' | awk -v ORS='' 'NR==".a:n."{print $1}'")
    return rev
endfunction

function! GetPastRevisionByList(n)
    let f = expand("%:p")
    let num = a:n < 1 ? 10 : a:n
    let rev = system("svn log -q --limit ".num." ".f." |awk '$2{print $1 \" \" $3 \" \" $5}' | awk -v ORS=',' '{print NR-1\": \"$1\" \"$2\" \"$3}'")
    let lines = split(rev,',')
    let choice = inputlist(lines)
    if choice >= 0 && choice < len(lines)
        let r = split(lines[choice],' ')[1]
    else
        echo "どれかを選択してください"
        let r = 0
    endif
    return r
endfunction


"範囲移動
"nnoremap <C-K> :m -2<CR>
"nnoremap <C-J> :m +1<CR>
vnoremap <C-K> :m -2<CR>v '<
vnoremap <C-J> :m '>+1<CR>v '<

au FileType php inoremap <C-e> <ESC>$a;


nnoremap <F4> :call TestFunc()<CR>
function! TestFunc()
    let f = system("svn st | egrep \"^M\" | awk '{print $2}'")
    let dirs = split(f, '/')
    echo dirs
endfunction
"---------------------------------------------------
" タブに{tabNo} - {window count}を表示する
"---------------------------------------------------
if v:version >= 700

    function! TabLine()
        let res = ''
        let curtab = tabpagenr()
        let i = 1
        for i in range(1, tabpagenr('$'))
            let res .= ((i == curtab) ? '%#TabLineSel#' : '%#TabLine#')
            let res .= i . '-' . tabpagewinnr(i, '$') . ':'
            let res .= substitute(bufname(tabpagebuflist(i)[0]), '.\+\/', '', 'g')
            let res .= ' '
            let i += 1
            exe | endfor
        let res .= '%#TabLineFill#'
        return res
    endfunction

    set tabline=%!TabLine()

endif

"
" high light current line
"
au WinLeave * set nocursorline
au WinEnter * set cursorline
set cursorline "cursorcolumn

"---------------------------------------------------
" Vundles Setting
"---------------------------------------------------
if has('vim_starting')
  set nocompatible               " be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'unite.vim'
NeoBundle 'unite-locate'
NeoBundle 'unite-font'
NeoBundle 'unite-colorscheme'
NeoBundle 'surround.vim'
NeoBundle 'git://github.com/Rykka/colorv.vim.git'
NeoBundle 'git://github.com/pasela/unite-webcolorname.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'JavaScript-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'git://github.com/digitaltoad/vim-jade.git'
NeoBundle 'https://github.com/Shougo/neosnippet.vim'
NeoBundle 'https://github.com/vim-scripts/BlackSea.git'
NeoBundle 'https://github.com/scrooloose/nerdtree.git'
NeoBundle 'https://github.com/vim-scripts/sudo.vim.git'
NeoBundle 'git://github.com/jimsei/winresizer.git'
"Bundle 'git://github.com/nathanaelkane/vim-indent-guides.git'
if v:version <= 703
  NeoBundle 'git://github.com/Shougo/neocomplcache.vim.git'
endif
if v:version > 703
  NeoBundle 'git://github.com/Shougo/neocomplete.vim.git'
endif
" Bundle 'git://github.com/thinca/vim-ref.git'
NeoBundle 'Keithbsmiley/rspec.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'git://github.com/tpope/vim-fugitive.git'
NeoBundle 'git://github.com/chriskempson/tomorrow-theme.git'
NeoBundle 'git://github.com/Shougo/vimfiler.vim.git'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'git://github.com/gregsexton/gitv.git'

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'git://github.com/nanotech/jellybeans.vim.git'
NeoBundle 'git://github.com/scrooloose/nerdcommenter.git'
NeoBundle 'git://github.com/evidens/vim-twig.git'

" original repos on github
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"Bundle 'rails.vim'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

"---------------------------------------------------
" Unite Setting
"---------------------------------------------------
let g:unite_enable_start_insert = 1
let g:unite_enable_split_vertically = 1
"unite keymap prefix
nnoremap [unite] <Nop>
nmap <Space>u [unite]
"register list
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register -default-action=yank<CR>
"mru list
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"buffer list
nnoremap <silent> [unite]b :<C-u>Unite buffer -default-action=vsplit<CR>
"unite outline
nnoremap <silent> [unite]o :<C-u>Unite outline<CR>

"---------------------------------------------------
" Window Keymap Setting
"---------------------------------------------------
"quick chenge window size
"Ctrl + E jkhl
"nnoremap [winsize] <Nop>
"nmap <C-E> [winsize]
"nnoremap [winsize]k :resize -3<CR>
"nnoremap [winsize]j :resize +3<CR>
"nnoremap [winsize]h :vertical resize +10<CR>
"nnoremap [winsize]l :vertical resize -10<CR>

"---------------------------------------------------
" neocomplepop setting
"---------------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Unite Snip
imap <C-s>  <Plug>(neocomplcache_start_unite_snippet)

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
if v:version > 703
  let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
endif
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" plugin rank
if !exists('g:neocomplcache_plugin_rank')
  let g:neocomplcache_plugin_rank = {}
endif
let g:neocomplcache_plugin_rank.buffer_complete = 90

"================================================================================
" original value
"================================================================================
let g:winresizer_enable = 1
let g:winresizer_start_key = '<C-E>'

"================================================================================
" quickrun settings
"================================================================================
let g:quickrun_config = {}
let g:quickrun_config._ = {'runner' : 'vimproc', "runner/vimproc/updatetime" : 10}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'cmdopt': '-cfd'}
let g:quickrun_config['ruby'] = {'cmdopt': '-w'}

augroup UjihisaRSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

nnoremap [quickrun] <Nop>
nmap <Space>k [quickrun]
nnoremap <silent> [quickrun]r :call QRunRspecCurrentLine()<CR>
fun! QRunRspecCurrentLine()
  let line = line(".")
  exe ":QuickRun -exec '%c %s%o' -cmdopt ':" . line . " -cfd'"
endfun


"================================================================================
" Open junk file.
"================================================================================
command! -nargs=0 JunkFile call s:open_junk_file()
function! s:open_junk_file()
  let l:junk_dir = $HOME . '/.vim_junk'. strftime('/%Y/%m')
  if !isdirectory(l:junk_dir)
    call mkdir(l:junk_dir, 'p')
  endif

  let l:filename = input('Junk Code: ', l:junk_dir.strftime('/%Y-%m-%d-%H%M%S.'))
  if l:filename != ''
    execute 'edit ' . l:filename
  endif
endfunction

"================================================================================
" Ruby jump do - end
"================================================================================
source $VIMRUNTIME/macros/matchit.vim

"================================================================================
" 独自拡張を読み込む
" 独自拡張が優先させるため、このブロックは末尾に記載する事
"================================================================================
"
if glob("$HOME/.vimrc_org") != ''
  source $HOME/.vimrc_org
endif

"引数なしでvimを開いたらNERDTreeを起動，ありなら起動しない
let file_name = expand("%")
if has('vim_starting') &&  file_name == ""
  if file_name == ""
    autocmd VimEnter * NERDTree ./
  endif
endif

let NERDTreeDirArrows=0

" delete white space at end of line when write buffer
"autocmd BufWritePre * :%s/\s\+$//e

" 80列以降を強調表示
set textwidth=0
if exists('&colorcolumn')
    set colorcolumn=+1
    " sh,cpp,perl,vim,...の部分は自分が使う
    " プログラミング言語のfiletypeに合わせてください
    autocmd FileType sh,cpp,perl,vim,ruby,python,haskell,scheme,php,ruby.rspec,javascript setlocal textwidth=80
    highlight ColorColumn ctermbg=darkblue
    highlight Todo ctermbg=darkyellow ctermfg=darkgreen
endif

nnoremap <F3> :echo expand("%:p")<CR>

" vim-airline color settings
let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
  if g:airline_theme == 'tomorrow'
    for colors in values(a:palette.inactive)
      let colors[3] = 245
    endfor
  endif
endfunction

" for syntastic
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
" let g:syntastic_mode_map = { 'mode': 'active',
"             \ 'active_filetypes': ['ruby', 'ruby.rspec'] }
" let g:syntastic_ruby_checkers = ['rubocop']

if v:version > 703
  set regexpengine=1
endif

" for nerdcommenter
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle
