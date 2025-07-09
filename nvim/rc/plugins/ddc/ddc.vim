" hook_source {{{
inoremap <silent><expr> <C-l> ddc#complete_common_string()
inoremap <silent><expr> <CR>  pumvisible() ? "\<C-y>" : "\<CR>"
""inoremap <silent><expr> <TAB> ddc#map#manual_complete()
inoremap <expr> <TAB>
      \ pum#visible() ?
      \   '<Cmd>call pum#map#insert_relative(+1, "empty")<CR>' :
      \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
      \   '<TAB>' : ddc#map#manual_complete()
inoremap <C-n>   <Cmd>call pum#map#select_relative(+1)<CR>
inoremap <C-p>   <Cmd>call pum#map#select_relative(-1)<CR>
""inoremap <C-n>   <Cmd>call pum#map#insert_relative(+1, "empty")<CR>
""inoremap <C-p>   <Cmd>call pum#map#insert_relative(-1, "empty")<CR>
inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
inoremap <C-o>   <Cmd>call pum#map#confirm_matched_pattern('^\S\+')<CR>

call ddc#custom#patch_global('sources', ['lsp', 'around', 'buffer', 'file'])
call ddc#custom#patch_global('sourceOptions', {
    \ '_': {
    \   'ignoreCase': v:true,
    \   'matchers': ['matcher_head'],
    \   'sorters': ['sorter_rank'],
    \ },
    \ 'around': {
    \     'mark': 'A',
    \  },
    \ 'buffer': {
    \     'mark': 'B',
    \  },
    \ 'file': {
    \     'mark': 'F',
    \     'isVolatile': v:true,
    \     'forceCompletionPattern': '\S/\S*',
    \     'minAutoCompleteLength': 1,
    \  },
    \ 'lsp': {
    \     'mark': 'LSP',
    \     'forceCompletionPattern': '\.\w*|:\w*|->\w*',
    \     'minAutoCompleteLength': 1,
    \ },
    \ })
call ddc#custom#patch_global('sourceParams', {
    \ 'buffer': {
    \    'requireSameFiletype': v:false,
    \    'cwdAsRoot': v:true,
    \ },
    \ 'lsp': {
    \    'lspEngine': 'vim-lsp',
    \    'bufnr': v:null,
    \    'confirmBehavior': 'insert',
    \    'enableAdditionalTextEdit': v:true,
    \    'enableDisplayDetail': v:true,
    \    'enableResolveItem': v:true,
    \ },
    \ })
call ddc#custom#patch_global('autoCompleteEvents', [
    \ 'InsertEnter', 'TextChangedI', 'TextChangedP',
    \ 'TextChangedT',
    \ ])
"    \ 'CmdlineEnter', 'CmdlineChanged', 'TextChangedT',
call ddc#custom#patch_global('ui', 'pum')
call popup_preview#enable()
call ddc#enable()
" }}}
