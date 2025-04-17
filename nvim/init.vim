" ~/.config/nvim/init.vim

" MyAutoCmd グループを定義
augroup MyAutoCmd
  autocmd!
augroup END

setlocal updatetime=500

function! Setup()
  let $VIMHOME = expand('<sfile>:h')

  " dpp のキャッシュディレクトリを設定
  let $CACHE = expand('~/.cache')

  if !isdirectory($CACHE)
    call mkdir($CACHE, 'p')
  endif

  " DPP_CACHE_DIR 環境変数を設定
  let $DPP_CACHE_DIR = expand('$HOME/.cache/dppn')
endfunction

call Setup()

" Vim script の設定ファイルの読み込み
execute 'source' $VIMHOME . '/rc/core/options.vim'
execute 'source' $VIMHOME . '/rc/core/mappings.vim'
execute 'source' $VIMHOME . '/rc/core/filetype.vim'
execute 'source' $VIMHOME . '/rc/ui/terminal.vim'
execute 'source' $VIMHOME . '/rc/plugins.vim'

" dpp の設定
if filereadable($VIMHOME . '/rc/plugins/dpp/dpp.ts')
  execute 'source' $VIMHOME . '/rc/plugins/dpp/dpp.vim'
endif

" vimrc
if filereadable($VIMHOME . '/vimrc')
  execute 'source' $VIMHOME . '/vimrc'
endif

" autoload
if filereadable($VIMHOME . '/autoload/myconfig.vim')
  execute 'source' $VIMHOME . '/autoload/myconfig.vim'
endif

" Biomeのフォーマッタを実行
function! FormatWithBiome()
  let l:file = expand('%')
  let l:cmd = 'biome format -write ' . l:file
  call system(l:cmd)
  edit!
endfunction

" ファイル保存時に自動フォーマットを実行
"autocmd BufWritePre *.ts,*.tsx call FormatWithBiome()
