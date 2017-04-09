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

" highlight color
hi CursorLine   term=reverse cterm=none ctermbg=238 guifg=#E19972
highlight Comment ctermfg=242
highlight Statement ctermfg=Cyan
highlight Search ctermfg=Black
highlight Visual ctermbg=4
highlight LineNr ctermfg=248 ctermbg=238
highlight CursorLineNr ctermfg=248 ctermbg=238
highlight PreProc ctermfg=141
highlight Special ctermfg=141
highlight cSpecial ctermfg=141
highlight Pmenu ctermfg=255 ctermbg=4
highlight Type ctermfg=Cyan
highlight Constant ctermfg=1
highlight Conceal ctermfg=242

