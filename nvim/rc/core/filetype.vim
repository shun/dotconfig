" ~/.config/nvim/rc/core/filetype.vim

" modeline を有効にします。
" modeline は、ファイル内のコメントで設定を記述できる機能です。
" *.txt, *.jax ファイルのみで有効にします。
autocmd MyAutoCmd BufRead,BufWritePost *.txt,*.jax setlocal modeline

" markdown ファイルのキーワードから `"` を削除します。
autocmd MyAutoCmd BufEnter,BufRead,BufNewFile *.md setlocal iskeyword-='

" ファイルタイプを検出します。
" ファイルタイプが設定されていない場合や、ファイルタイプが検出された場合に実行します。
autocmd MyAutoCmd BufWritePost * nested
\ : if &l:filetype ==# '' || 'b:ftdetect'->exists()
\ |   unlet! b:ftdetect " b:ftdetect 変数を削除します。
\ |   silent filetype detect " ファイルタイプを検出します。
\ | endif

" ファイルタイプがシェルスクリプトの場合に、実行権限を付与します。
function! s:chmod(file) abort
  const perm = a:file->getfperm() " ファイルの権限を取得します。
  const newperm = printf('%sx%sx%sx', perm[0:1], perm[3:4], perm[6:7]) " 実行権限を付与します。
  if perm !=# newperm
    call setfperm(a:file, newperm) " ファイルの権限を更新します。
  endif
endfunction
autocmd MyAutoCmd BufWritePost * nested
      \ : if 1->getline()->stridx('#!/') ==# 0 " ファイルの1行目が #! で始まる場合に実行します。
      \ |   call s:chmod('<afile>'->expand()) " ファイルに実行権限を付与します。
      \ | endif

" /tmp ディレクトリ以下のファイルを読み込んだ場合wrapを有効にします。
autocmd MyAutoCmd BufRead /tmp/* setlocal wrap

" 標準プラグインを無効にします。
let g:loaded_2html_plugin      = v:true
let g:loaded_getscriptPlugin   = v:true
let g:loaded_gtags             = v:true
let g:loaded_gtags_cscope      = v:true
let g:loaded_gzip              = v:true
let g:loaded_logiPat           = v:true
let g:loaded_man               = v:true
let g:loaded_matchit           = v:true
let g:loaded_matchparen        = v:true
"let g:loaded_netrwFileHandlers = v:true
"let g:loaded_netrwPlugin       = v:true
"let g:loaded_netrwSettings     = v:true
let g:loaded_rrhelper          = v:true
let g:loaded_shada_plugin      = v:true
let g:loaded_spellfile_plugin  = v:true
let g:loaded_tarPlugin         = v:true
let g:loaded_tutor_mode_plugin = v:true
let g:loaded_vimballPlugin     = v:true
let g:loaded_zipPlugin         = v:true
