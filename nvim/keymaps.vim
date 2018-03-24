" ---------------------------------------------------------
" | Keybindings

" let mapleader = "\<Space>"

" nomal/visual mode
map <silent> <F3> :<C-u>setlocal relativenumber!<cr>
nmap <ESC><ESC> :noh<cr>
nnoremap ,tn :tabnew<cr>
nnoremap <Leader>Q :bd!<cr>
nnoremap <Leader>q :bd<cr>
nnoremap <Leader>w :w<cr>
nnoremap <S-i> i <ESC><Right>
nnoremap <silent><C-h> :tabprevious<cr>
nnoremap <silent><C-l> :tabnext<cr>
nnoremap <silent><C-k> d$
nnoremap <silent>J n
nnoremap <silent>K N
nnoremap <silent>gr/ :set hlsearch<cr>
nnoremap <silent>j gj
nnoremap <silent>k gk
nnoremap Q <Nop>
nnoremap QQ :q<cr>
nnoremap g/ /
nnoremap gj j
nnoremap gk k
noremap <C-e> <END>
noremap <silent><C-a> :call <SID>home()<cr>

noremap <silent>MB :call <SID>newTermBottom()<cr>
noremap <silent>MR :call <SID>newTermRight()<cr>

noremap H <C-w>h
noremap J <C-w>j
noremap K <C-w>k
noremap L <C-w>l

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
Gautocmdft eruby inoremap <C-t>%% <%  %><LEFT><LEFT><LEFT>
Gautocmdft eruby inoremap <C-t>%= <%=  %><LEFT><LEFT><LEFT>

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
"tnoremap <UP> <C-\><C-n><C-w>ki
"tnoremap <DOWN> <C-\><C-n><C-w>ji
"tnoremap <LEFT> <C-\><C-n><C-w>hi
"tnoremap <RIGHT> <C-\><C-n><C-w>li

function! s:home()
    let start_column = col('.')
    normal! ^
    if col('.') == start_column
        normal! 0
    endif
    return ''
endfunction

function! s:newTermBottom()
    :sp
    :wincmd j
    :terminal
    :set nonu
    :startinsert
endfunction

function! s:newTermRight()
    :vs
    :wincmd l
    :terminal
    :set nonu
    :startinsert
endfunction

" ---------------------------------------------------------
" | plugin keymaps
" ---------------------------------------------------------

" #########################################################
" deol
"
nnoremap <silent><Leader>q  :<C-u>call deol#kill_editor()<cr>
nnoremap <silent>,tm :<C-u>call deol#new({'command': 'bash', 'cwd' : $PWD})<cr>

" #########################################################
" delve
"
Gautocmdft go nmap  <silent><buffer><Leader>db     :<C-u>DlvBreakpoint<cr>
Gautocmdft go nmap  <silent><buffer><Leader>dc     :<C-u>DlvContinue<cr>
Gautocmdft go nmap  <silent><buffer><Leader>dd     :<C-u>DlvDebug<cr>
Gautocmdft go nmap  <silent><buffer><Leader>dn     :<C-u>DlvNext<cr>
Gautocmdft go nmap  <silent><buffer><Leader>dr     :<C-u>DlvBreakpoint<cr>


" #########################################################
" previm
"
" #########################################################
" gina
"
nnoremap <silent>,ga       :<C-u>Gina add %<cr>
nnoremap <silent>,gc       :<C-u>Gina commit<cr>
nnoremap <silent>,gp       :<C-u>Gina push<cr>
nnoremap <silent>,gs       :<C-u>Gina status<cr>
nnoremap <silent>,gl       :<C-u>Gina log<cr>


" #########################################################
" vimfiler
"
"nnoremap <silent><Leader>f  :VimFiler<cr>
"nnoremap <silent><Leader>v  :<C-u>VimFiler -invisible<cr>
nnoremap <Leader>f  :Dirvish %


" #########################################################
" denite
"
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')

nnoremap <silent><Space>m :<C-u>Denite -highlight-mode-insert=MatchParen -matchers=matcher_substring -buffer-name=file_mru -mode=normal file_mru<cr>
nnoremap <silent><Space>r :<C-u>Denite -highlight-mode-insert=MatchParen -matchers=matcher_substring -buffer-name=file_rec -mode=normal file_rec<cr>
nnoremap <silent><Space>l :<C-u>Denite -highlight-mode-insert=MatchParen -matchers=matcher_substring -buffer-name=line -mode=normal line<cr>
nnoremap <silent><Space>b :<C-u>Denite -highlight-mode-insert=MatchParen -matchers=matcher_substring -buffer-name=buffer -mode=normal buffer<cr>
nnoremap <silent><Space>g :<C-u>Denite -highlight-mode-insert=MatchParen -matchers=matcher_substring -buffer-name=grep -mode=normal grep<cr>

nnoremap <silent><Space>rm :<C-u>Denite -highlight-mode-insert=MatchParen -matchers=matcher_substring -buffer-name=file_mru -mode=normal -resume <cr>
nnoremap <silent><Space>rr :<C-u>Denite -highlight-mode-insert=MatchParen -matchers=matcher_substring -buffer-name=file_rec -mode=normal -resume <cr>
nnoremap <silent><Space>rl :<C-u>Denite -highlight-mode-insert=MatchParen -matchers=matcher_substring -buffer-name=line -mode=normal -resume cr>
nnoremap <silent><Space>rb :<C-u>Denite -highlight-mode-insert=MatchParen -matchers=matcher_substring -buffer-name=buffer -mode=normal -resume <cr>
nnoremap <silent><Space>rg :<C-u>Denite -highlight-mode-insert=MatchParen -matchers=matcher_substring -buffer-name=grep -mode=normal -resume <cr>

nnoremap <silent><Space>Rm :<C-u>Denite -matchers=matcher_substring -buffer-name=file_mru -mode=normal -resume -refresh<cr>
nnoremap <silent><Space>Rr :<C-u>Denite -matchers=matcher_substring -buffer-name=file_rec -mode=normal -resume -refresh<cr>
nnoremap <silent><Space>Rl :<C-u>Denite -matchers=matcher_substring -buffer-name=line -mode=normal -resume -refresh<cr>
nnoremap <silent><Space>Rb :<C-u>Denite -matchers=matcher_substring -buffer-name=buffer -mode=normal -resume -refresh<cr>
nnoremap <silent><Space>Rg :<C-u>Denite -matchers=matcher_substring -buffer-name=grep -mode=normal -resume -refresh<cr>

nnoremap <silent>/ :<C-u>Denite -highlight-mode-insert=MatchParen -buffer-name=search -auto-highlight -smartcase line<cr>
nnoremap <silent>* :<C-u>DeniteCursorWord -buffer-name=search -auto-highlight -mode=normal -smartcase line<cr>
nnoremap <silent>n :<C-u>Denite -buffer-name=search -resume -mode=normal -refresh<cr>

nnoremap sd :DeniteCursorWord -highlight-mode-insert=MatchParen -matchers=matcher_substring -buffer-name=gtags_def gtags_def<cr>
nnoremap sr :DeniteCursorWord -highlight-mode-insert=MatchParen -matchers=matcher_substring -buffer-name=gtags_ref gtags_ref<cr>
nnoremap sg :DeniteCursorWord -highlight-mode-insert=MatchParen -matchers=matcher_substring -buffer-name=gtags_grep gtags_grep<cr>
nnoremap sc :Denite -highlight-mode-insert=MatchParen -matchers=matcher_substring -buffer-name=gtags_completion gtags_completion<cr>
nnoremap sf :Denite -highlight-mode-insert=MatchParen -matchers=matcher_substring -buffer-name=gtags_file gtags_file<cr>
nnoremap sp :Denite -highlight-mode-insert=MatchParen -matchers=matcher_substring -buffer-name=gtags_path gtags_path<cr>

vnoremap sd :Denite -highlight-mode-insert=MatchParen -cursor-pos=0 -buffer-name=gtags_def gtags_def<cr>
vnoremap sr :Denite -highlight-mode-insert=MatchParen -cursor-pos=0 -buffer-name=gtags_ref gtags_ref<cr>
vnoremap sg :Denite -highlight-mode-insert=MatchParen -cursor-pos=0 -buffer-name=gtags_grep gtags_grep<cr>
vnoremap sc :Denite -highlight-mode-insert=MatchParen -buffer-name=gtags_completion gtags_completion<cr>
vnoremap sf :Denite -highlight-mode-insert=MatchParen -buffer-name=gtags_file gtags_file<cr>
vnoremap sp :Denite -highlight-mode-insert=MatchParen -buffer-name=gtags_path gtags_path<cr>

nnoremap rsd :Denite -resume -mode=normal -refresh -buffer-name=gtags_def gtags_def<cr>
nnoremap rsr :Denite -resume -mode=normal -refresh -buffer-name=gtags_ref gtags_ref<cr>
nnoremap rsg :Denite -resume -mode=normal -refresh -buffer-name=gtags_grep gtags_grep<cr>
nnoremap rsc :Denite -resume -mode=normal -refresh -buffer-name=gtags_completion gtags_completion<cr>
nnoremap rsf :Denite -resume -mode=normal -refresh -buffer-name=gtags_file gtags_file<cr>
nnoremap rsp :Denite -resume -mode=normal -refresh -buffer-name=gtags_path gtags_path<cr>

nnoremap Rsd :Denite -resume -mode=normal -buffer-name=gtags_def gtags_def<cr>
nnoremap Rsr :Denite -resume -mode=normal -buffer-name=gtags_ref gtags_ref<cr>
nnoremap Rsg :Denite -resume -mode=normal -buffer-name=gtags_grep gtags_grep<cr>
nnoremap Rsc :Denite -resume -mode=normal -buffer-name=gtags_completion gtags_completion<cr>
nnoremap Rsf :Denite -resume -mode=normal -buffer-name=gtags_file gtags_file<cr>
nnoremap Rsp :Denite -resume -mode=normal -buffer-name=gtags_path gtags_path<cr>


" #########################################################
" vim-easy-align
"
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" #########################################################
" neoterm
"
nnoremap ,tn :Tnew<cr>
nnoremap ,vn :VTn<cr>

command! -complete=shellcmd VTn
      \ silent call user#neoterm#vertical({-> execute('Tnew') })

" clear terminal
nnoremap <silent><leader>tl :call neoterm#clear()<cr>
nnoremap <silent><leader>tL :call neoterm#hardclear()<cr>


" #########################################################
" plantuml
"
Gautocmdft plantuml nnoremap  <silent><M-d>     :OpenUml<cr><cr>
