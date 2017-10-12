call denite#custom#source('_',          'matchers', ['matcher_substring'])
call denite#custom#source('grep',       'matchers', ['matcher_substring'])
call denite#custom#source('gtags_def',  'matchers', ['matcher_substring'])
call denite#custom#source('gtags_file', 'matchers', ['matcher_substring'])
call denite#custom#source('gtags_grep', 'matchers', ['matcher_substring'])
call denite#custom#source('gtags_path', 'matchers', ['matcher_substring'])
call denite#custom#source('gtags_ref',  'matchers', ['matcher_substring'])

call denite#custom#source(
\ 'file_rec', 'vars', {
\   'command': [
\      'pt', '--follow', '--nocolor', '--nogroup', '--smart-case', '-g=', ''
\   ] })

call denite#custom#source(
\ 'file_mru', 'matchers', ['matcher_fuzzy', 'matcher_project_files'])

call denite#custom#var('grep', 'command',
\ ['pt', '--nogroup', '--nocolor', '--smart-case', '--hidden'])
"call denite#custom#var('grep', 'command', ['pt'])
"call denite#custom#var('grep', 'default_opts',
"\ ['--nogroup', '--nocolor', '--smart-case', '--hidden', '-g=', ''])
"call denite#custom#var('grep', 'recursive_opts', [])
"call denite#custom#var('grep', 'pattern_opt', [])
"call denite#custom#var('grep', 'separator', ['--'])
"call denite#custom#var('grep', 'final_opts', ['.'])

call denite#custom#var('outline', 'command', ['global', '-f', expand('%')])
"call denite#custom#var('outline', 'command', ['global'])
"call denite#custom#var('outline', 'options', ['-f', expand('%')])
call denite#custom#var('outline', 'file_opt', [])
call denite#custom#var('outline', 'ignore_types', [])
call denite#custom#var('outline', 'encoding', ['utf-8'])

let s:menus = {}
let s:menus.vim = {
    \ 'description': 'Vim',
    \ }
let s:menus.vim.file_candidates = [
    \ ['    > Edit configuation file (init.vim)', '~/.config/nvim/init.vim']
    \ ]

