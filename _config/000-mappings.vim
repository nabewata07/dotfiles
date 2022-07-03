"vimでbackspaceが効かないときの設定
"  は制御コードDELete
noremap  
noremap!  

" ビジュアルモードで選択したところを*で検索する
vnoremap * "zy:let @/ = @z<CR>n
" jkでEsc
inoremap jk <Esc>
" Esc Esc でハイライトOFF
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" ファイルのフルパスを表示
nnoremap <F3> :echo expand("%:p")<CR>

nnoremap <C-n> gt
nnoremap <C-p> gT
nnoremap <Space>s. :<C-u>source $HOME/.vimrc<CR>

" autoclose
inoremap (<CR> ()<Left>
inoremap '<CR> ''<Left>
inoremap "<CR> ""<Left>
inoremap [<CR> []<Left>
inoremap {<CR> {}<Left>
inoremap <<CR> <><Left>
