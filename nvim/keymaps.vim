" ---------------------------------------------------------
" | Keybindings

" let mapleader = "\<Space>"

" nomal/visual mode
noremap <C-a> <HOME>
noremap <C-e> <END>
noremap <C-p> <UP>
noremap <C-n> <DOWN>
noremap <C-f> <RIGHT>
noremap <C-b> <LEFT>
noremap <M-n> <S-Down>
noremap <M-p> <S-Up>
noremap <UP> <S-Up>
noremap <DOWN> <S-Down>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>e :QuickRun<CR>
nmap <ESC><ESC> :noh<CR>

"map <silent> <Leader>m :<C-u>Denite file_mru<CR>
"map <silent> <Leader>r :<C-u>Denite file_rec<CR>
"map <silent> <Leader>l :<C-u>Denite line<CR>

map <silent> <F3> :<C-u>setlocal relativenumber!<CR>

" insert mode
inoremap jj <ESC>
inoremap <C-c> <ESC>
inoremap <C-a> <HOME>
inoremap <C-e> <END>
inoremap <C-p> <UP>
inoremap <C-n> <DOWN>
inoremap <C-f> <RIGHT>
inoremap <C-b> <LEFT>
inoremap <C-j> <RETURN>

" visual mode

" console mode
cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-D> <Delete>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-N> <Down>
cnoremap <C-P> <Up>

