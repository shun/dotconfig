" insert mode if Tnew execute
let g:neoterm_autoinsert = 1

nnoremap ,tn :Tnew<CR>
nnoremap ,vn :VTn<CR>

command! -complete=shellcmd VTn
      \ silent call user#neoterm#vertical({-> execute('Tnew') })

" clear terminal
nnoremap <silent> <leader>tl :call neoterm#clear()<cr>
nnoremap <silent> <leader>tL :call neoterm#hardclear()<cr>

