" ~/.config/nvim/rc/core/mappings.vim

" リーダーキーを設定します。
" リーダーキーは、キーマッピングの際に使用する特殊なキーです。
let g:mapleader = ',' " グローバルなリーダーキー
let g:maplocalleader = 'm' " ローカルなリーダーキー

" ============================================================================
" all mode
"
noremap <C-a> <HOME>
noremap <C-e> <END>

" ============================================================================
" normal mode
"
nnoremap <silent><ESC><ESC> :noh<cr>
nnoremap <silent>j gj
nnoremap <silent>k gk
nnoremap ;  <Nop>
nnoremap m  <Nop>
nnoremap ,  <Nop>
noremap <C-k> d$

" Space キーをリーダーキーとして使います。
nnoremap <Space>   <Nop>

" バッファ操作に関するキーマッピングを設定します。
"   sp: バッファを縦に分割します。
"   so: カレントバッファのみを表示します。
"   <Tab>: 次のバッファに移動します。
nnoremap sp  <Cmd>vsplit<CR><Cmd>wincmd w<CR>
nnoremap so  <Cmd>only<CR>
nnoremap <Tab>      <cmd>wincmd w<CR>
" quickfix window を閉じます。
nnoremap <expr> q
      \   &l:filetype ==# 'qf'
      \ ? '<Cmd>cclose<CR><Cmd>lclose<CR>'
      \ : '#'->winnr()->getwinvar('&winfixbuf')
      \ ? ''
      \ : '$'->winnr() > 1 && range(1, '$'->winnr())
      \   ->map({ _, val -> val->winbufnr()->getbufvar('&filetype') })
      \   ->filter({_, val -> val ==# 'qf' })->empty()
      \ ? '<Cmd>close<CR>'
      \ : ''

" 検索に関するキーマッピングを設定します。
"   s/: は / で始まる検索
"   s?: は ? で始まる検索
nnoremap s/    /\<%
nnoremap s?    ?\<%

" x を、切り取りした内容を破棄するキーマッピングを設定します。
nnoremap x "_x

" <C-f> と <C-b> をスマートスクロールにします。
" <expr> は、マッピングが評価された結果に基づいて、異なる動作をします。
" <C-d> は、下にスクロール
" <C-u> は、上にスクロール
noremap <expr> <C-f>
      \    max([winheight(0) - 2, 1])
      \ .. '<C-d>' .. (line('w$') >= line('$') ? 'L' : 'M')
noremap <expr> <C-b>
      \    max([winheight(0) - 2, 1])
      \ .. '<C-u>' .. (line('w0') <= 1 ? 'H' : 'M')

" 再描画します。
nnoremap <C-l>    <Cmd>redraw!<CR>

" fold を開閉します
nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zo0' : 'l'
xnoremap <expr> l foldclosed(line('.')) != -1 ? 'zogv0' : 'l'

" substitute を簡単に行うためのキーマップです。
xnoremap s :s//g<Left><Left>


" ============================================================================
" insert mode
"
inoremap jj <ESC>
inoremap <C-p> <UP>
inoremap <C-n> <DOWN>
inoremap <C-f> <RIGHT>
inoremap <C-b> <LEFT>
inoremap <C-e> <END>

" ============================================================================
" command mode
"

" ============================================================================
" terminal mode
"
tnoremap <C-q> <C-\><C-n>
