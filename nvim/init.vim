if &compatible
  set nocompatible
endif

let mapleader = "\<Space>"
augroup GlobalAutoCmd
  autocmd!
augroup END
command! -nargs=* Gautocmd   autocmd GlobalAutoCmd <args>
command! -nargs=* Gautocmdft autocmd GlobalAutoCmd FileType <args>


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

" Open terminal on new buffer
autocmd VimEnter * if @% == '' && s:GetBufByte() == 0 | call Term()
"autocmd VimEnter * s:open_deol()
function! s:GetBufByte()
  let byte = line2byte(line('$') + 1)
  if byte == -1
    return 0
  else
    return byte - 1
  endif
endfunction
function! Term()
"  call termopen(&shell)
  call deol#start({'command': 'bash', 'cwd' : getcwd()})
endfunction
autocmd FileType python setlocal completeopt-=preview
autocmd FileType go setlocal completeopt-=preview

