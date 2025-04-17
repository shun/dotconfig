" hook_add {{{
nnoremap <Space>/ <Cmd>Ddu -name=search line -ui-param-ff-startFilter<CR>
nnoremap <Space>* <Cmd>Ddu -name=search line -input=`expand('<cword>')` -ui-param-ff-startFilter=v:false<CR>
nnoremap <Space>n <Cmd>Ddu -name=search -resume -ui-param-ff-startFilter=v:false<CR>

nnoremap <Space>g <Cmd>Ddu -name=grep rg -source-param-rg-input=`input('Input: ', expand('<cword>'))`<CR>

nnoremap ;g <Cmd>Ddu -name=grep rg -source-param-rg-input=`input('Input: ')`<CR>
nnoremap ;* <Cmd>Ddu -name=grep rg -source-param-rg-input=`input('Input: ', expand('<cword>'))`<CR>
nnoremap ;n <Cmd>Ddu -name=grep -resume -ui-param-ff-startFilter=v:false<CR>

nnoremap <Space>f <Cmd>Ddu file_external<CR>
nnoremap <Space>b <Cmd>Ddu buffer<CR>
nnoremap - <Cmd>Ddu
      \ -name=filer -ui=filer -sync file
      \ -source-option-file-path=`t:->get('ddu_ui_filer_path', expand('%:h'))`
      \ -source-option-file-columns=filename
      \ <CR>
" }}}

" hook_source {{{
call ddu#custom#patch_global({
    \   'ui': 'ff',
    \   'profile': v:false,
    \   'sourceOptions' : {
    \     '_' : {
    \       'matchers': ['matcher_kensaku'],
    \     },
    \     'file_old': {
    \       'matchers': [
    \         'matcher_substring', 'matcher_relative', 'matcher_hidden',
    \       ],
    \     },
    \     'file_external': {
    \       'matchers': [
    \         'matcher_substring', 'matcher_hidden',
    \       ],
    \     },
    \     'help': {
    \         'defaultAction': 'open',
    \     },
    \   },
    \   'sourceParams' : {
    \     'file_external': {
    \       'cmd': ['rg', '--ignore-case', '--files', '--glob', '!.git',
    \             '--color', 'never', '--no-messages'],
    \       'updateItems': 50000,
    \     },
    \     'buffer' : {
    \       'orderby': 'desc',
    \     },
    \     'rg' : {
    \       'args': ['--json'],
    \       'inputType': 'migemo',
    \       'highlights': {
    \         'path': 'Blue',
    \         'lineNr': 'Green',
    \         'word': 'Orange',
    \       }
    \     },
    \   },
    \   'kindOptions': {
    \     'file': {
    \       'defaultAction': 'open',
    \     },
    \   },
    \   'uiParams': {
    \     'ff': {
    \       'filterSplitDirection': 'floating',
    \     }
    \   },
    \   'filterParams': {
    \     'matcher_kensaku': {
    \       'highlightMatched': 'Orange',
    \     },
    \   },
    \ })
call ddu#custom#patch_local('default', {
    \   'uiParams': {
    \     'ff': {
    \       'split': 'horizontal',
    \       'prompt': '> ',
    \     }
    \   },
    \ })
call ddu#custom#patch_local('filer', {
    \   'ui': 'filer',
    \   'sources': [{
    \     'name': 'file',
    \     'params': {
    \       'path': expand('%:p:h'),
    \     },
    \   }],
    \   'sourceOptions': {
    \     '_': {
    \       'matchers': ['matcher_substring'],
    \       'sorters': ['sorter_alpha'],
    \     },
    \   },
    \   'sourceParams': {
    \     'file': {
    \       'path': expand('%:p:h'),
    \     },
    \   },
    \   'uiParams': {
    \     'filer': {
    \       'split': 'horizontal',
    \       'splitDirection': 'topleft',
    \     },
    \   },
    \ })
" }}}
