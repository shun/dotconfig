" ---------------------------------------------------------
" | Keybindings

" let mapleader = "\<Space>"

" nomal/visual mode
noremap <C-a> <HOME>
noremap <C-e> <END>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :bd!<CR>
nnoremap QQ :q<CR>
nnoremap <Leader>e :QuickRun<CR>
nmap <ESC><ESC> :noh<CR>
nnoremap /  /\v
nnoremap ,tm :terminal<CR>
nnoremap ,tn :tabnew<CR>
nnoremap <silent> <C-l> :tabnext<CR>
nnoremap <silent> <C-h> :tabprevious<CR>
"nnoremap <Leader><C-]> :GtagsCursor<CR>
"nnoremap <Leader><C-f> :Gtags -f %<CR>
"nnoremap <Leader>n :cn<CR>
"nnoremap <Leader>p :cp<CR>

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
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

" terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <UP> <C-\><C-n><C-w>ki
tnoremap <DOWN> <C-\><C-n><C-w>ji
tnoremap <LEFT> <C-\><C-n><C-w>hi
tnoremap <RIGHT> <C-\><C-n><C-w>li

Gautocmdft go nmap  <silent><buffer><Leader>db     :<C-u>DlvBreakpoint<CR>
Gautocmdft go nmap  <silent><buffer><Leader>dc     :<C-u>DlvContinue<CR>
Gautocmdft go nmap  <silent><buffer><Leader>dd     :<C-u>DlvDebug<CR>
Gautocmdft go nmap  <silent><buffer><Leader>dn     :<C-u>DlvNext<CR>
Gautocmdft go nmap  <silent><buffer><Leader>dr     :<C-u>DlvBreakpoint<CR>

