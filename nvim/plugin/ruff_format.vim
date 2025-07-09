if !exists('*RuffFixFormat')
  function! RuffFixFormat() abort
    " ① 現バッファを保存（実ファイル経由）
    write
    let l:file = expand('%:p')

    " ② 末尾カンマ強制 (COM812) → フォーマット
    silent execute '!uvx ruff check --select COM812 --fix ' . shellescape(l:file)
    silent execute '!uvx ruff format ' . shellescape(l:file)

    " ③ 再読込。plugin/ は再評価されないので E127 が起きない
    silent edit!
  endfunction
endif
