let g:NERDTreeNodeDelimiter = "\u00a0"

let file_name = expand("%")
if has('vim_starting') &&  file_name == ""
  if file_name == ""
    autocmd VimEnter * NERDTree ./
  endif
endif
