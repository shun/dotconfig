" lightline
let g:lightline = {
      \ 'colorscheme': 'mymolokai',
      \ 'active' : {
      \   'left': [
      \      [ 'mode', 'paste' ],
      \      [ 'gitbranch', 'readonly', 'relativepath', 'modified' ],
      \    ]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ 
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

