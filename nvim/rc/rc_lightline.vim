" lightline
let g:lightline = {
      \ 'colorscheme': 'Dracula',
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

