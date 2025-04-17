" ddu-ff {{{
autocmd CursorHold ddu-ff call ddu#ui#do_action('preview')

nnoremap <buffer> <CR> <Cmd>call ddu#ui#do_action('itemAction')<CR>
nnoremap <buffer> <Space> <Cmd>call ddu#ui#do_action('toggleSelectItem')<CR>
nnoremap <buffer> i <Cmd>call ddu#ui#do_action('openFilterWindow')<CR>
nnoremap <buffer> q <Cmd>call ddu#ui#do_action('quit')<CR>
nnoremap <buffer> d
    \ <Cmd>call ddu#ui#do_action('itemAction', {'name': 'delete'})<CR>
" }}}


