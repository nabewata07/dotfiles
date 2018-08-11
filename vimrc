" +++++++++++++++++++
" open all folds  zR
" close all folds  zM
" @see :h fold
" +++++++++++++++++++

" !! vimは--with-lua を推奨 !!

" {{{ 基本的な設定
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
set fileformats=unix,mac,dos
"音を消す
set vb t_vb=

" バックスペースキーで削除できるものを指定
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

" jkでEsc
inoremap jk <Esc>
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

set lazyredraw

set tabpagemax=60

" {{{ NeoBundle Section
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
" NeoBundle 'unite-colorscheme'
NeoBundle 'surround.vim'
NeoBundle 'pasela/unite-webcolorname.git'
NeoBundle 'thinca/vim-quickrun.git'
NeoBundle 'othree/yajs.vim'
NeoBundle 'digitaltoad/vim-jade.git'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'jimsei/winresizer.git'
NeoBundle 'Keithbsmiley/rspec.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'chriskempson/tomorrow-theme.git'
NeoBundle 'Shougo/vimfiler.vim.git'
NeoBundle 'w0rp/ale'
NeoBundle 'gregsexton/gitv.git'

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'nanotech/jellybeans.vim.git'
NeoBundle 'scrooloose/nerdcommenter.git'
NeoBundle 'evidens/vim-twig.git'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'SQLUtilities'
NeoBundle 'Align'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'fatih/vim-go'
NeoBundle 'kannokanno/previm'
NeoBundle 'elzr/vim-json'
NeoBundle 'aklt/plantuml-syntax'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'HerringtonDarkholme/yats.vim'
NeoBundle 'posva/vim-vue'

" 遅延読み込み
" dependsは依存関係：Updateも一緒にされる
" 'insert' : 1 はinsertモードのときに読み込まれる
NeoBundle 'Shougo/neosnippet.vim', {
      \ 'depends' : ['Shougo/neosnippet-snippets'],
      \ 'insert' : 1,
      \ 'filetypes' : 'snippet',
      \ 'unite_sources' : [
      \ 'neosnippet', 'neosnippet/user', 'neosnippet/runtime'],
      \ }

function! s:meet_neocomplete_requirements()
    return has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
endfunction

if s:meet_neocomplete_requirements()
    NeoBundleLazy 'Shougo/neocomplete.vim', {
        \ 'depends' : 'Shougo/context_filetype.vim',
        \ 'insert' : 1
        \ }
    NeoBundleFetch 'Shougo/neocomplcache.vim' " Bundle管理するけど読み込まない
else
    NeoBundleFetch 'Shougo/neocomplete.vim'
    NeoBundle 'Shougo/neocomplcache.vim', {
         \ 'insert' : 1
         \ }
endif

call neobundle#end()

NeoBundleCheck
" }}}

"
" highlight current line
"
au WinLeave * set nocursorline
au WinEnter * set cursorline
set cursorline "cursorcolumn

" extra space, 全角スペースの表示
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=darkred ctermbg=darkred
  autocmd VimEnter,WinEnter * match TrailingSpaces /\(\s\+$\|　\)/
augroup END

" 行番号を黄色に
autocmd ColorScheme * hi LineNr ctermfg=yellow
" diffの色の調整
autocmd ColorScheme * hi DiffAdd term=bold cterm=bold ctermfg=254 ctermbg=237 gui=bold
autocmd ColorScheme * hi DiffChange ctermfg=172 ctermbg=237
autocmd ColorScheme * hi DiffDelete ctermfg=167 ctermbg=234
autocmd ColorScheme * hi SpellBad ctermfg=white ctermbg=red

colorscheme Tomorrow-Night-Bright

filetype plugin on
filetype indent on

nnoremap <F3> :echo expand("%:p")<CR>

" mark 80th column
if exists('&colorcolumn')
  set colorcolumn=+1
  setlocal textwidth=80
  highlight ColorColumn ctermbg=darkblue
  highlight Todo ctermbg=darkyellow ctermfg=darkgreen
endif

" }}}

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
" }}}

" {{{ ctags
"----------------------------------------------------
" 同じ関数名があった場合、どれに飛ぶか選択できるようにする
nnoremap <C-]> g<C-]>

" [tag tab] 新しいタブでジャンプ
nnoremap tt :tab sp<CR> :exe("tjump ".expand('<cword>'))<CR>

"taglist
" let Tlist_Ctags_Cmd = "/usr/bin/ctags"    "ctagsのパス
let Tlist_Show_One_File = 1               "現在編集中のソースのタグしか表示しない
let Tlist_Exit_OnlyWindow = 1             "taglistのウィンドーが最後のウィンドーならばVimを閉じる
let Tlist_Use_Right_Window = 1            "taglistを右側で開く
" 現在のディレクトリから再帰的に上層のtagsファイルを探す
" }}}

" {{{ オートコマンド
"----------------------------------------------------
" カーソル位置を記憶する
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

"<TAB>で補完
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
" }}}

" {{{ キーマップ割り当てセクション
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

" autoclose
inoremap (<CR> ()<Left>
inoremap '<CR> ''<Left>
inoremap "<CR> ""<Left>
inoremap [<CR> []<Left>
inoremap {<CR> {}<Left>
inoremap <<CR> <><Left>
" }}}


" {{{ 範囲移動
"nnoremap <C-K> :m -2<CR>
"nnoremap <C-J> :m +1<CR>
vnoremap <C-K> :m -2<CR>v '<
vnoremap <C-J> :m '>+1<CR>v '<
" }}}

" {{{ タブに{tabNo} - {window count}を表示する
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
" }}}

"  {{{ Unite Setting
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
" }}}


" {{{ neosnippet settings
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" }}}

" {{{ neocomplcache or neocomplete setting
"---------------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

if s:meet_neocomplete_requirements()
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
else
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

  inoremap <expr><C-g>     neocomplcache#undo_completion()
  inoremap <expr><C-l>     neocomplcache#complete_common_string()

  " Unite Snip
  imap <C-s>  <Plug>(neosnippet_start_unite_snippet)

  " SuperTab like snippets behavior.
  "imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
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
  "let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
  "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
  let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

  " plugin rank
  if !exists('g:neocomplcache_plugin_rank')
    let g:neocomplcache_plugin_rank = {}
  endif
  let g:neocomplcache_plugin_rank.buffer_complete = 90
endif
" }}}

" {{{ original value
"================================================================================
let g:winresizer_enable = 1
let g:winresizer_start_key = '<C-E>'
" }}}

" {{{ quickrun settings
"================================================================================
let g:quickrun_config = {}
let g:quickrun_config._ = {'runner' : 'vimproc', "runner/vimproc/updatetime" : 10}

let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'exec': 'bundle exec %c %o %s', 'cmdopt': '-cfd'}
" let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'cmdopt': '-cfd'}
let g:quickrun_config['ruby'] = {'cmdopt': '-w'}

autocmd BufRead,BufNewFile *_test.go set filetype=go.test
let g:quickrun_config['go.gotest'] = {'command': 'go test', 'cmdopt': '-run'}

augroup GroupRspec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

augroup GroupGoTest
  autocmd!
  autocmd BufWinEnter,BufNewFile *_test.go set filetype=go.gotest
augroup END

nnoremap [quickrun] <Nop>
nmap <Space>k [quickrun]
nnoremap <silent> [quickrun]r :call QRunRspecCurrentLine()<CR>
fun! QRunRspecCurrentLine()
  let line = line(".")
  " exe ":QuickRun -exec '%c %s%o' -cmdopt ':" . line . " -cfd'"
  exe ":QuickRun -exec 'bundle exec %c %s%o' -cmdopt ':" . line . " -cfd'"
endfun
" }}}


" {{{ Open junk file.
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
" }}}

" {{{ enable match it to Extend matching with %
"================================================================================
source $VIMRUNTIME/macros/matchit.vim
" }}}

" {{{ NerdTree settings
"引数なしでvimを開いたらNERDTreeを起動，ありなら起動しない
let file_name = expand("%")
if has('vim_starting') &&  file_name == ""
  if file_name == ""
    autocmd VimEnter * NERDTree ./
  endif
endif

" }}}

" {{{ vim-airline color settings
let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
  if g:airline_theme == 'tomorrow'
    for colors in values(a:palette.inactive)
      let colors[3] = 245
    endfor
  endif
endfunction
" }}}

if v:version > 703
  set regexpengine=1
endif

" {{{ for nerdcommenter
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

" }}}

" Edit file by tabedit.
let g:vimfiler_edit_action = 'tabopen'

call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')


" {{{ 各タブページのカレントバッファ名+αを表示
function! s:tabpage_label(n)
  " t:title と言う変数があったらそれを使う
  let title = gettabvar(a:n, 'title')
  if title !=# ''
    return title
  endif

  " タブページ内のバッファのリスト
  let bufnrs = tabpagebuflist(a:n)

  " カレントタブページかどうかでハイライトを切り替える
  let hi = a:n is tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'

  " バッファが複数あったらバッファ数を表示
  let no = len(bufnrs)
  if no is 1
    let no = ''
  endif
  " タブページ内に変更ありのバッファがあったら '+' を付ける
  let mod = len(filter(copy(bufnrs), 'getbufvar(v:val, "&modified")')) ? '+' : ''
  let sp = (no . mod) ==# '' ? '' : ' '  " 隙間空ける

  " カレントバッファ
  let curbufnr = bufnrs[tabpagewinnr(a:n) - 1]  " tabpagewinnr() は 1 origin
  let fname = pathshorten(bufname(curbufnr))

  let label = no . mod . sp . fname

  return '%' . a:n . 'T' . hi . label . '%T%#TabLineFill#'
endfunction

function! MakeTabLine()
  let titles = map(range(1, tabpagenr('$')), 's:tabpage_label(v:val)')
  let sep = ''  " タブ間の区切りなし
  let tabpages = join(titles, sep) . sep . '%#TabLineFill#%T'
  let info = ''  " 好きな情報を入れる
  return tabpages . '%=' . info  " タブリストを左に、情報を右に表示
endfunction

set tabline=%!MakeTabLine()
" }}}

" {{{ vim-go setting
" By default syntax-highlighting for Functions, Methods and Structs is disabled.
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Enable goimports to automatically insert import paths instead of gofmt:
let g:go_fmt_command = "goimports"

" By default vim-go shows errors for the fmt command, to disable it:
" let g:go_fmt_fail_silently = 1

" Disable auto fmt on save:
let g:go_fmt_autosave = 0

" Disable opening browser after posting your snippet to play.golang.org:
" let g:go_play_open_browser = 0

autocmd filetype go autocmd QuitPre <buffer> GoFmt
autocmd filetype go.test autocmd QuitPre <buffer> GoFmt
" autocmd filetype go autocmd BufWritePre <buffer> GoLint

let g:go_metalinter_enabled = 1

nnoremap <C-g> :GoErrCheck<CR>
" }}}

" {{{ gotags setting
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
" }}}

" vim: foldmethod=marker:

" {{{ previm plugin settings
"---------------------------------------------------
let g:previm_open_cmd = 'open -a Google\ Chrome'
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
" }}}

vnoremap * "zy:let @/ = @z<CR>n

" to show double quote in JSON file
" with NeoBundle 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0

let g:neosnippet#snippets_directory = '$HOME/.vim/snippets/'

" vim-vue plugin settings
" TODO 都度実行しなくてもいい
" vimrc読み込まれるときだけでいい
let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

"================================================================================
" 独自拡張を読み込む
" 独自拡張が優先させるため、このブロックは末尾に記載する事
"================================================================================
"
if glob("$HOME/.vimrc_org") != ''
  source $HOME/.vimrc_org
endif
