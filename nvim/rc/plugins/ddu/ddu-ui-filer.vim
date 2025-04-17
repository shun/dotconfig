" ddu-filer {{{
"inoremap <buffer><silent> <CR> <Esc><Cmd>close<CR>
"nnoremap <buffer><silent> <CR> <Cmd>close<CR>
autocmd CursorHold ddu-filer call ddu#ui#do_action('preview')

nnoremap <buffer><silent><expr> l
  \ ddu#ui#get_item()->get('isTree', v:false) ?
  \ "<Cmd>call ddu#ui#do_action('itemAction', {'name': 'narrow'})<CR>" :
  \ "<Cmd>call ddu#ui#do_action('itemAction', {'name': 'open', 'params': {}})<CR>"

nnoremap <buffer><silent><expr> <CR>
  \ ddu#ui#get_item()->get('isTree', v:false) ?
  \ "<Cmd>call ddu#ui#do_action('itemAction', {'name': 'narrow'})<CR>" :
  \ "<Cmd>call ddu#ui#do_action('itemAction', {'name': 'open', 'params': {}})<CR>"

nnoremap <buffer><silent><expr> <Space>
  \ ddu#ui#get_item()->get('isTree', v:false) ?
  \ "<Cmd>call ddu#ui#do_action('itemAction', {'name': 'narrow'})<CR>" :
  \ "<Cmd>call ddu#ui#do_action('itemAction', {'name': 'open', 'params': {'command': 'split'}})<CR>"

nnoremap <buffer><silent> <Esc>
  \ <Cmd>call ddu#ui#do_action('quit')<CR>

nnoremap <buffer><silent> q
  \ <Cmd>call ddu#ui#do_action('quit')<CR>

nnoremap <buffer><silent> -
  \ <Cmd>call ddu#ui#do_action('itemAction', {'name': 'narrow', 'params': {'path': '..'}})<CR>

nnoremap <buffer><silent> c
  \ <Cmd>call ddu#ui#do_action('itemAction', {'name': 'copy'})<CR>

nnoremap <buffer><silent> p
  \ <Cmd>call ddu#ui#do_action('itemAction', {'name': 'paste'})<CR>

nnoremap <buffer><silent> D
  \ <Cmd>call ddu#ui#do_action('itemAction', {'name': 'delete'})<CR>

nnoremap <buffer><silent> R
  \ <Cmd>call ddu#ui#do_action('itemAction', {'name': 'rename'})<CR>

nnoremap <buffer><silent> M
  \ <Cmd>call ddu#ui#do_action('itemAction', {'name': 'move'})<CR>

nnoremap <buffer><silent> N
  \ <Cmd>call ddu#ui#do_action('itemAction', {'name': 'newFile'})<CR>

nnoremap <buffer><silent> mk
  \ <Cmd>call ddu#ui#do_action('itemAction', {'name': 'newDirectory'})<CR>

nnoremap <buffer><silent> yy
  \ <Cmd>call ddu#ui#do_action('itemAction', {'name': 'yank'})<CR>
" }}}

