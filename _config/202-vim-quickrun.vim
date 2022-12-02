let g:quickrun_config = {}
let g:quickrun_config._ = {'runner' : 'vimproc', "runner/vimproc/updatetime" : 10}

if filereadable("./Gemfile")
  let g:quickrun_config['ruby'] = {'cmdopt': '-w', 'command': 'ruby', 'exec': 'bundle exec %c %o %s'}
  let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'exec': 'bundle exec %c %o %s', 'cmdopt': '-cfd'}
  fun! QRunRspecCurrentLine()
    let line = line(".")
    exe ":QuickRun -exec 'bundle exec %c %s%o' -cmdopt ':" . line . " -cfd'"
  endfun
else
  let g:quickrun_config['ruby'] = {'cmdopt': '-w'}
  let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'cmdopt': '-cfd'}
  fun! QRunRspecCurrentLine()
    let line = line(".")
    exe ":QuickRun -exec '%c %s%o' -cmdopt ':" . line . " -cfd'"
  endfun
endif

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

nnoremap <Leader>r <Plug>(quickrun)
nnoremap [quickrun] <Nop>
nmap <Space>k [quickrun]
nnoremap <silent> [quickrun]r :call QRunRspecCurrentLine()<CR>
