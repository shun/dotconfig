
if has('mac')
    source ~/.config/nvim/rc/rc_deoplete_mac.vim
endif

if has('unix')
    source ~/.config/nvim/rc/rc_deoplete_linux.vim
endif

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_omnicppcomplete_compliance = 0
let g:clang_make_default_keymappings = 0

let g:deoplete#sources#jedi#python_path = g:python3_host_prog
let g:deoplete#sources#jedi#enable_cache = 1
let g:deoplete#sources#clang#debug = 'True'

let g:deoplete#sources = {}
"let g:deoplete#sources._ = ['buffer', 'tag']
"
"
"let g:deoplete#omni#input_patterns = {}
"let g:deoplete#omni#input_patterns.python = ''
"let g:deoplete#omni#functions = {}
"'
" deoplete-go
let g:deoplete#sources#go#align_class = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#package_dot = 1

" deoplete-rust
let g:deoplete#sources#rust#racer_binary = '/Users/skudo/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path = '$HOME/workspace/gitrepo/rust/src'
let g:deoplete#sources#rust#disable_keym=1

