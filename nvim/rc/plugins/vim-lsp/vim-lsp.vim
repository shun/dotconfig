" hook_source {{{
"let g:lsp_signs_enabled = 0
"let g:lsp_diagnostics_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_signature_help_enabled = 0
"let g:lsp_virtual_text_enabled = 1
"let g:lsp_signs_error = {'text': '✗'}
"let g:lsp_signs_warning = {'text': '‼'}
"let g:lsp_signs_information = {'text': 'i'}
"let g:lsp_signs_hint = {'text': '?'}
"let g:lsp_highlight_references_enabled = 0
"let g:lsp_preview_float = 1
"let g:lsp_insert_text_enabled = 0
"let g:lsp_text_edit_enabled = 0
"let g:lsp_auto_enable = 0
"let g:lsp_completion_documentation_enabled = 0

let g:lsp_settings_servers_dir = expand('~/.local/share/vim-lsp-settings/servers')
"let g:lsp_log_verbose = 1
let g:lsp_log_file = "/tmp/vim-lsp.log"
"let g:lsp_settings_filetype_typescript = ['typescript-language-server']
" For clangd(c/cpp language server)
"if (executable('clangd'))
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'clangd',
"        \ 'cmd': {server_info->['clangd', '-background-index']},
"        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
"        \ })
"endif

if executable('rust-analyzer')
  au User lsp_setup call lsp#register_server({
        \   'name': 'Rust Language Server',
        \   'cmd': {server_info->['rust-analyzer']},
        \   'whitelist': ['rust'],
        \ })
endif

"set omnifunc=lsp#complete
"function! s:on_lsp_buffer_enabled() abort
"    setlocal omnifunc=lsp#complete
"    setlocal signcolumn=yes
"    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
"    nmap <buffer> gd <plug>(lsp-definition)
"    nmap <buffer> gr <plug>(lsp-references)
"    nmap <buffer> gi <plug>(lsp-implementation)
"    nmap <buffer> gt <plug>(lsp-type-definition)
"    nmap <buffer> ,rn <plug>(lsp-rename)
"    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
"    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
"    nmap <buffer> <Space>h <plug>(lsp-hover)
"    " refer to doc to add more commands
"endfunction

"augroup lsp_install
"    au!
"    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
"    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
"augroup END
"
nnoremap <silent>sd <Cmd>LspDefinition<cr>
nnoremap <silent>sr <Cmd>LspReferences<cr>
nnoremap <silent>sh <Cmd>LspHover<cr>


" TypeScript Language Server の設定
if executable('typescript-language-server')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript',
        \ 'cmd': {server_info->['typescript-language-server', '--stdio']},
        \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'],
        \ 'initialization_options': {},
        \ })
endif
" }}}
