"---------------------------------------------------------------------------
" denite.nvim
"
let s:denite_win_width_percent = 0.85
let s:denite_win_height_percent = 0.7

" Change denite default options

" Pt command on grep source
call denite#custom#var('file/rec', 'command',
    \ ['rg', '--files', '--glob', '!.git', '--color', 'never'])

call denite#custom#var('grep', {
    \ 'command': ['rg'],
    \ 'default_opts': ['-i', '--vimgrep', '--no-heading', '--sort', 'path'],
    \ 'recursive_opts': [],
    \ 'pattern_opt': ['--regexp'],
    \ 'separator': ['--'],
    \ 'final_opts': [],
    \ })

" Change ignore_globs
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

call denite#custom#option('default', {
      \ 'highlight_filter_background': 'CursorLine',
      \ 'source_names': 'short',
      \ 'split': 'floating',
      \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
      \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
      \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
      \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
      \ })

nnoremap <silent><Space>b :<C-u>Denite buffer<cr>
nnoremap <Space>g :<C-u>DeniteCursorWord grep:
nnoremap <Space>l :<C-u>Denite file/rec line<cr>
nnoremap ,/ /
nnoremap / :<C-u>Denite -buffer-name=search -start-filter line<cr>
nnoremap <Space>/ :<C-u>Denite -buffer-name=search -start-filter -auto-action=preview line<cr>
nnoremap n :<C-u>Denite -buffer-name=search -resume -refresh -auto-action=preview -no-start-filter<cr>
nnoremap * :<C-u>DeniteCursorWord -buffer-name=search -start-filter line<cr>
nnoremap <Space>* :<C-u>DeniteCursorWord -buffer-name=search -start-filter -auto-action=preview line<cr>
