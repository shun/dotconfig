if &compatible
  set nocompatible
endif

let mapleader = "\<Space>"
augroup GlobalAutoCmd
  autocmd!
augroup END
command! -nargs=* Gautocmd   autocmd GlobalAutoCmd <args>
command! -nargs=* Gautocmdft autocmd GlobalAutoCmd FileType <args>


let g:config_dir = expand($XDG_CONFIG_HOME . '/nvim')
let g:cache_dir = expand($XDG_CACHE_HOME . '/nvim')
let g:rc_dir = g:config_dir . '/rc.d'

" load commom settings
execute 'source' g:config_dir . '/rc.common.vim'

if has('nvim')
  execute 'source' g:config_dir . '/rc.nvim'
else 
  execute 'source' g:config_dir . '/rc.vim'
endif

syntax on

