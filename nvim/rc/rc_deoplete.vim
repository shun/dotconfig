let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_omnicppcomplete_compliance = 0
let g:clang_make_default_keymappings = 0

let g:python3_host_prog = '/usr/local/bin/python3'
let g:deoplete#sources#jedi#python_path = g:python3_host_prog
let g:deoplete#sources#jedi#enable_cache = 1
let g:deoplete#sources#clang#debug = 'True'

" deoplete-clang

let g:deoplete#sources = {}
"let g:deoplete#sources._ = ['buffer', 'tag']
"
"
"let g:deoplete#omni#input_patterns = {}
"let g:deoplete#omni#input_patterns.python = ''
"let g:deoplete#omni#functions = {}
"'
" libclang shared library path
let g:deoplete#sources#clang#libclang_path='/usr/local/Cellar/llvm38/3.8.1/lib/llvm-3.8/lib/libclang.dylib'
"
" clang builtin header path
let g:deoplete#sources#clang#clang_header='/usr/local/include/clang'

"" libclang default compile flags

" deoplete-go
let g:deoplete#sources#go#align_class = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#package_dot = 1

