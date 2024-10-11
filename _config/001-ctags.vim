" ctags
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
