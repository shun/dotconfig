if &compatible
  set nocompatible
endif

let mapleader = "\<Space>"
augroup GlobalAutoCmd
  autocmd!
augroup END
command! -nargs=* Gautocmd   autocmd GlobalAutoCmd <args>
command! -nargs=* Gautocmdft autocmd GlobalAutoCmd FileType <args>


let s:config_home = expand("$XDG_CONFIG_HOME")
let s:cache_home = expand("$XDG_CACHE_HOME")

let g:config_dir = ""
let g:cache_dir = ""

if s:config_home == "$XDG_CONFIG_HOME"
  let g:config_dir = expand('~/.config/nvim')
else
  let g:config_dir = expand("$XDG_CONFIG_HOME") . '/nvim'
endif

if s:cache_home == "$XDG_CACHE_HOME"
  let g:cache_dir = expand('~/.cache/nvim')
else
  let g:cache_dir = expand("$XDG_CACHE_HOME") . '/nvim'
endif

let g:rc_dir = g:config_dir . '/rc.d'

if has('mac')
  let g:python3_host_prog = '/usr/local/bin/python3'
elseif has('unix')
  let g:python3_host_prog = '/usr/bin/python3'
endif

" load commom settings

if has('nvim')
  execute 'source ' . g:config_dir . '/rc.common.vim'
  execute 'source ' . g:config_dir . '/rc.nvim'
  syntax enable
else
  syntax on
  execute 'source ' . g:config_dir . '/rc.common.vim'
  execute 'source ' . g:config_dir . '/rc.vim'
endif


