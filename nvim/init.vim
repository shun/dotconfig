if &compatible
  set nocompatible
endif

let mapleader = "\<Space>"

let s:config_dir = expand($XDG_CONFIG_HOME . '/nvim')
let s:cache_dir = expand($XDG_CACHE_HOME . '/nvim')

" load plugins
execute 'source' s:config_dir . '/rc/rc_dein.vim'

" deoplete config
execute 'source' s:config_dir . '/rc/rc_deoplete.vim'

syntax on
filetype plugin indent on

" set options
execute 'source' s:config_dir . '/options.vim'

" lightline config
execute 'source' s:config_dir . '/rc/rc_lightline.vim'

" keymappings
execute 'source' s:config_dir . '/keymaps.vim'

