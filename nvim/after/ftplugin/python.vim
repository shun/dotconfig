" Ex コマンド
command! RuffFormat call RuffFixFormat()

" 保存時に自動実行（Python バッファのみ）
augroup RuffAutoFormat
  autocmd!
  autocmd BufWritePre <buffer> RuffFormat
augroup END
