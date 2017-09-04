" ---------------------------------------------------------
" | Keybindings

" let mapleader = "\<Space>"

" nomal/visual mode
"noremap <C-a> <HOME>
noremap <silent><C-a> :call <SID>home()<CR>
nnoremap <silent><C-k> d$
noremap <C-e> <END>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :bd<CR>
nnoremap <Leader>Q :bd!<CR>
nnoremap QQ :q<CR>
"nnoremap <Leader>e :QuickRun<CR>
nmap <ESC><ESC> :noh<CR>
nnoremap <S-i> i <ESC><Right>
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap Q <Nop>
"nnoremap ,tm :terminal<CR>
nnoremap ,tn :tabnew<CR>
nnoremap <silent> <C-l> :tabnext<CR>
nnoremap <silent> <C-h> :tabprevious<CR>
nnoremap <silent> ,tm :<C-u>call deol#new({'command': 'bash', 'cwd' : $PWD})<CR>
nnoremap <silent> ,tl :call neoterm#clear()<cr>
nnoremap <silent><Leader>q  :<C-u>call deol#kill_editor()<CR>
nnoremap <silent><Leader>f  :VimFiler<CR>
nnoremap g/ /
nnoremap <silent>gr/ :set hlsearch<cr>
nnoremap <silent>J n
nnoremap <silent>K N
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

" terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <UP> <C-\><C-n><C-w>ki
tnoremap <DOWN> <C-\><C-n><C-w>ji
tnoremap <LEFT> <C-\><C-n><C-w>hi
tnoremap <RIGHT> <C-\><C-n><C-w>li

function! s:home()
    let start_column = col('.')
    normal! ^
    if col('.') == start_column
        normal! 0
    endif
    return ''
endfunction

Gautocmdft go nmap  <silent><buffer><Leader>db     :<C-u>DlvBreakpoint<CR>
Gautocmdft go nmap  <silent><buffer><Leader>dc     :<C-u>DlvContinue<CR>
Gautocmdft go nmap  <silent><buffer><Leader>dd     :<C-u>DlvDebug<CR>
Gautocmdft go nmap  <silent><buffer><Leader>dn     :<C-u>DlvNext<CR>
Gautocmdft go nmap  <silent><buffer><Leader>dr     :<C-u>DlvBreakpoint<CR>

