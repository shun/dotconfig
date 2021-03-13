" ---------------------------------------------------------
" | setting

set cindent
set clipboard+=unnamedplus
set completeopt-=preview
set cursorline
set encoding=utf-8
set expandtab
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp
set fileformats=unix,mac,dos
set hidden
set hlsearch
set ignorecase
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
"set mouse=a
set nobackup
"set noincsearch
set noswapfile
set nowrapscan
set nu
"set relativenumber
set ruler
set scrolloff=8
set shiftwidth=4
set showcmd
set showmatch
set signcolumn=yes
set smartcase
set softtabstop=0
set t_Co=256
set tabstop=4
set ttimeout
set ttimeoutlen=50
set wildignorecase
set wildmode=longest,full
autocmd InsertLeave * set nopaste


" highlight color
"highlight CursorLine    term=reverse cterm=none                 ctermbg=235
"highlight Comment                               ctermfg=35
"highlight Statement                             ctermfg=Cyan
"highlight Search                                ctermfg=White   ctermbg=141
"highlight Visual                                ctermfg=White   ctermbg=4
"highlight LineNr                                ctermfg=248     ctermbg=234
"highlight CursorLineNr                          ctermfg=0       ctermbg=216
"highlight PreProc                               ctermfg=141
"highlight Special                               ctermfg=141
"highlight cSpecial                              ctermfg=141
"highlight Pmenu                                 ctermfg=255     ctermbg=238
"highlight PmenuSel                              ctermfg=255     ctermbg=19
"highlight Type                                  ctermfg=Cyan
"highlight Constant                              ctermfg=1
"highlight Conceal                               ctermfg=242
"highlight MatchParen                 cterm=bold ctermfg=White   ctermbg=26
"highlight SpecialKey                            ctermfg=242
"highlight DiffChange                            ctermfg=Black   ctermbg=84
"highlight DiffAdd                               ctermfg=Black   ctermbg=84
"highlight DiffDelete                            ctermfg=Black   ctermbg=218
"highlight DiffText                              ctermfg=Black   ctermbg=192
"highlight SpellBad                              ctermfg=Black   ctermbg=Red
"highlight SpellCap                              ctermfg=Black   ctermbg=Red
"highlight NonText                               ctermfg=239

au BufRead,BufNewFile *.styl set filetype=css
au BufRead,BufNewFile *.nvim set filetype=vim
au BufRead,BufNewFile *.ts set filetype=typescript
au BufRead,BufNewFile *.vue set filetype=vue
au WinEnter,FocusGained * checktime

if has("autocmd")
  filetype plugin on
  filetype indent on
  "sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtab
  autocmd Filetype java        setlocal sw=4 sts=4 ts=4 et omnifunc=javacomplete#Complete
  autocmd FileType c           setlocal sw=2 sts=2 ts=2 et
  autocmd FileType cpp         setlocal sw=2 sts=2 ts=2 et
  autocmd FileType go          setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType php         setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType python      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType json        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType html        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType css         setlocal sw=2 sts=2 ts=2 et
  autocmd FileType javascript  setlocal sw=2 sts=2 ts=2 et
  autocmd FileType typescript  setlocal sw=2 sts=2 ts=2 et
  autocmd FileType yaml        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType js          setlocal sw=2 sts=2 ts=2 et
  autocmd FileType vue         setlocal sw=2 sts=2 ts=2 et
  autocmd FileType plantuml    setlocal sw=2 sts=2 ts=2 et
  autocmd FileType stpl        setlocal sw=4 sts=4 ts=4 noet
endif

filetype plugin indent on
autocmd FileType xml,html inoremap <buffer> </ </<C-x><C-o>

" ---------------------------------------------------------
" | Keybindings

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
nnoremap <silent>j gj
nnoremap <silent>k gk
nnoremap Q <Nop>
nnoremap QQ :q<cr>
noremap <C-e> <END>
noremap <silent><C-a> :call <SID>home()<cr>

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

" visual mode

" console mode
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Delete>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

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

