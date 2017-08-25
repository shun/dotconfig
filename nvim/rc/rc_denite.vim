"call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
"call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#source('_', 'matchers', ['matcher_substring'])

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

"nnoremap <silent> <Space>m :<C-u>Denite -mode=normal file_mru<CR>
"nnoremap <silent> <Space>r :<C-u>Denite -mode=normal file_rec<CR>
"nnoremap <silent> <Space>l :<C-u>Denite -mode=normal line<CR>
"nnoremap <silent> <Space>b :<C-u>Denite -mode=normal buffer<CR>
"nnoremap <silent> <Space>g :<C-u>Denite -mode=normal grep<CR>
"nnoremap <silent> / :<C-u>Denite -buffer-name=search -auto-highlight -smartcase line<CR>
"nnoremap <silent> * :<C-u>DeniteCursorWord -buffer-name=search -auto-highlight -mode=normal -smartcase line<CR>
"nnoremap <silent> n :<C-u>Denite -buffer-name=search -resume -mode=normal -refresh<CR>
"
"nnoremap sd :DeniteCursorWord -buffer-name=gtags_def gtags_def<cr>
"nnoremap sr :DeniteCursorWord -buffer-name=gtags_ref gtags_ref<cr>
"nnoremap sg :DeniteCursorWord -buffer-name=gtags_grep gtags_grep<cr>
"nnoremap sc :Denite -buffer-name=gtags_completion gtags_completion<cr>
"nnoremap sf :Denite -buffer-name=gtags_file gtags_file<cr>
"nnoremap sp :Denite -buffer-name=gtags_path gtags_path<cr>
"
"nnoremap sD :Denite -resume -mode=normal -refresh -buffer-name=gtags_def gtags_def<cr>
"nnoremap sR :Denite -resume -mode=normal -refresh -buffer-name=gtags_ref gtags_ref<cr>
"nnoremap sG :Denite -resume -mode=normal -refresh -buffer-name=gtags_grep gtags_grep<cr>
"nnoremap sC :Denite -resume -mode=normal -refresh -buffer-name=gtags_completion gtags_completion<cr>
"nnoremap sF :Denite -resume -mode=normal -refresh -buffer-name=gtags_file gtags_file<cr>
"nnoremap sP :Denite -resume -mode=normal -refresh -buffer-name=gtags_path gtags_path<cr>
