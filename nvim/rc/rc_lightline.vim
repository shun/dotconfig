" lightline
let g:lightline = {
      \ 'colorscheme': 'mymolokai',
      \ 'active' : {
      \   'left': [
      \      [ 'mode', 'paste' ],
      \      [ 'readonly', 'relativepath', 'modified' ],
      \    ]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

