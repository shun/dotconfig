" ---------------------------------------------------------
" | setting

set cindent
set clipboard+=unnamedplus
set cursorline
set encoding=utf-8
set expandtab
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp
set fileformats=unix,dos,mac
set hlsearch
set hidden
set ignorecase
set inccommand=split
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set mouse=a
set nobackup
set noswapfile
"set noincsearch
set nowrapscan
set nu
"set relativenumber
set ruler
set scrolloff=8
set shiftwidth=4
set showcmd
set showmatch
set smartcase
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set softtabstop=0
set t_Co=256
set tabstop=4
set ttimeout
set ttimeoutlen=50
set wildmode=longest,full
set wildignorecase
autocmd InsertLeave * set nopaste

" highlight color
highlight CursorLine    term=reverse cterm=none                 ctermbg=235
highlight Comment                               ctermfg=35
highlight Statement                             ctermfg=Cyan
highlight Search                                ctermfg=White   ctermbg=141
highlight Visual                                ctermfg=White   ctermbg=4
highlight LineNr                                ctermfg=248     ctermbg=234
highlight CursorLineNr                          ctermfg=0       ctermbg=216
highlight PreProc                               ctermfg=141
highlight Special                               ctermfg=141
highlight cSpecial                              ctermfg=141
highlight Pmenu                                 ctermfg=255     ctermbg=4
highlight Type                                  ctermfg=Cyan
highlight Constant                              ctermfg=1
highlight Conceal                               ctermfg=242
highlight MatchParen                 cterm=bold ctermfg=White   ctermbg=26
highlight SpecialKey                            ctermfg=242
highlight DiffChange                            ctermfg=Black   ctermbg=84
highlight DiffAdd                               ctermfg=Black   ctermbg=84
highlight DiffDelete                            ctermfg=Black   ctermbg=218
highlight DiffText                              ctermfg=Black   ctermbg=192
highlight SpellBad                              ctermfg=Black   ctermbg=Red
highlight SpellCap                              ctermfg=Black   ctermbg=Red
highlight NonText                               ctermfg=239

au BufRead,BufNewFile *.ts set filetype=typescript
au Filetype java setlocal omnifunc=javacomplete#Complete
au WinEnter,FocusGained * checktime

