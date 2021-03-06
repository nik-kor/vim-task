" Boilerplate
if (exists("b:did_ftplugin"))
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim


function! Toggle_task_status()
  let line = getline('.')
  if match(line, '^\(\s*\)-') == 0
    let line = substitute(line, '^\(\s*\)-', '\1+', '')
  else
    let line = substitute(line, '^\(\s*\)+', '\1-', '')
  endif
  call setline('.', line)
endfunction

inoremap <silent> <buffer> <C-l> <ESC>:call Toggle_task_status()<CR>i
noremap <silent> <buffer> <C-l> :call Toggle_task_status()<CR>

" Boilerplate
let &cpo = s:cpo_save
unlet s:cpo_save

