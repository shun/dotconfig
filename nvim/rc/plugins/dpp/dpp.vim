"---------------------------------------------------------------------------
" rc/plugins/dpp/dpp.vim: dpp のセットアップ処理を行う
"---------------------------------------------------------------------------

" NOTE: このファイルは dpp (Denops Plugin Manager) の初期化処理を記述します。

" dpp のプラグインディレクトリを runtimepath に追加する関数
function! s:dpp_setup_plugin(plugin)
  let dir = $DPP_CACHE_DIR .. '/repos/github.com/' .. a:plugin
  if !isdirectory(dir)
    " プラグインディレクトリが存在しない場合は、git clone を実行
    execute '!git clone https://github.com/' .. a:plugin dir
  endif

  execute 'set runtimepath^=' .. substitute(expand(dir, ':p'), '[/\\]$', '', '')
endfunction

" dpp の状態を生成する関数
function! s:dpp_make_state()
  call dpp#make_state($DPP_CACHE_DIR, $VIMHOME .. '/rc/plugins/dpp/dpp.ts')
endfunction

" パッケージのインストール
function! s:dpp_install(cmd) abort
  if denops#server#status() == "running"
    call dpp#async_ext_action('installer', a:cmd)
  else
    echo "denops is not started"
  endif
endfunction

" NOTE: dpp.vim と dpp-ext-lazy は必須
call s:dpp_setup_plugin('Shougo/dpp.vim')
call s:dpp_setup_plugin('Shougo/dpp-ext-lazy')

let s:plugins = [
\ 'Shougo/dpp.vim',
\ 'Shougo/dpp-ext-lazy',
\ 'Shougo/dpp-ext-installer',
\ 'Shougo/dpp-ext-local',
\ 'Shougo/dpp-ext-toml',
\ 'Shougo/dpp-protocol-git',
\ 'vim-denops/denops.vim',
\]

for s:plugin in s:plugins
  call s:dpp_setup_plugin(s:plugin)
endfor

" dpp の状態がロードされていなければ、状態を生成する
if dpp#min#load_state($DPP_CACHE_DIR)
  call s:dpp_make_state()
endif

" dpp の状態生成後に実行される処理
autocmd MyAutoCmd User Dpp:makeStatePost
      \ : echomsg 'dpp make_state() is done'

command! DppInstall :call s:dpp_install('install')
command! DppUpdate :call s:dpp_install('update')
command! DppMakeState :call s:dpp_make_state()

