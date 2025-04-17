" ~/.config/nvim/rc/core/options.vim

" nocompatible オプションは、Vim の互換モードを無効にします。
" Vim の機能を最大限に活用するために、必ず設定してください。
set nocompatible

" 行番号を表示します。
set number

" ヤンクしたテキストをクリップボードにコピー
if has('win32') || has('win64') || has('mac')
  set clipboard=unnamed
else
  set clipboard=unnamed,unnamedplus
endif

" 相対行番号を表示します。カーソル行からの相対的な行番号を表示します。
set relativenumber

" 編集中ではないバッファを隠します。
" バッファを閉じても、内容がメモリ上に残ります。
set hidden

" エンコーディングを設定します。
" utf-8 は、多くの文字を扱うことができる標準的なエンコーディングです。
set encoding=utf-8

" ファイルのエンコーディング候補を設定します。
" ファイルを開く際に、これらのエンコーディングで読み込みを試みます。
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932

" タブ幅を設定します。
set tabstop=4

" インデント幅を設定します。
set shiftwidth=4

" タブをスペースに変換します。
set expandtab

" スマートインデントを有効にします。
" 改行時に、前の行と同じインデントを適用します。
set smartindent

" オートインデントを有効にします。
" 改行時に、自動的にインデントを行います。
set autoindent

" 
set signcolumn=yes

" 
set autoread

" 行の折り返しを無効にします。
" 長い行は、画面からはみ出して表示されます。
set nowrap

" インクリメンタルサーチを有効にします。
" 検索時に、入力した文字に応じてリアルタイムで検索結果が表示されます。
set incsearch

" 検索結果のハイライトを有効にします。
set hlsearch

" 検索時に大文字小文字を区別しないようにします。
set ignorecase

" 大文字が含まれている場合は、大文字小文字を区別します。
set smartcase

" バックスペースキーの動作を設定します。
" indent, eol, start は、インデント、改行、行頭での削除を可能にします。
set backspace=indent,eol,start

" 不可視文字の表示を有効にします。
set list

" listcharsを設定します。
"   tab:▸\  タブを▸\で表示
"   trail:- 行末の空白を-で表示
"   precedes:« 行頭の空白を«で表示
"   nbsp:% 不改行スペースを%で表示
set listchars=tab:▸\ ,trail:-,precedes:«,nbsp:%

" コマンドラインの補完を設定します。
set wildmode=longest,list

" コマンドライン補完時に大文字小文字を区別しません
set wildignorecase

" スワップファイルを作成しないようにします。
set noswapfile

" バックアップファイルを作成しないようにします。
set nobackup

" undo ファイルを有効にします。
"set undofile

" カーソル位置から画面端までのスクロール量を設定します
set scrolloff=8
set sidescrolloff=8

" 履歴数を設定します。
set history=100

if has('nvim')
  " Neovim の場合は、shada を使用します。
  set shada='100,<20,s10,h,r/tmp/,rterm:
else
  " Vim の場合は、viminfo を使用します。
  set viminfo='100,<20,s10,h,r/tmp/
endif
" その他の設定
" キーマッピングのタイムアウト時間 (ミリ秒単位)
set timeout timeoutlen=500 ttimeoutlen=100

" カーソルを動かさないときの更新時間
set updatetime=100

autocmd FocusGained,BufEnter * checktime
