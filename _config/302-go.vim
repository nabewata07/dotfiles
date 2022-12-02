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
