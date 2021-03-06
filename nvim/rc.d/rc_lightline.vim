" lightline
let g:lightline = {
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

let g:lightline.enable = {
		    \ 'statusline': 1,
		    \ 'tabline': 1
		    \ }

let g:lightline = {'colorscheme' : 'tokyonight'}
"let s:black    = [ '#282a36', 235 ]
"let s:gray     = [ '#44475a', 236 ]
"let s:gray249  = [ '#44475a', 249 ]
"let s:white    = [ '#f8f8f2', 231 ]
"let s:darkblue = [ '#6272a4', 60 ]
"let s:cyan     = [ '#8be9fd', 117 ]
"let s:green    = [ '#50fa7b', 84 ]
"let s:orange   = [ '#ffb86c', 215 ]
"let s:purple   = [ '#bd93f9', 141 ]
"let s:red      = [ '#ff79c6', 212 ]
"let s:yellow   = [ '#f1fa8c', 228 ]
"
""let g:lightline.colorscheme = 'myDracula'
"let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
"let s:p.normal.left     = [ [ s:black, s:purple ], [ s:cyan, s:gray ] ]
"let s:p.normal.right    = [ [ s:black, s:purple ], [ s:white, s:darkblue ] ]
"let s:p.inactive.right  = [ [ s:black, s:gray ], [ s:white, s:black ] ]
"let s:p.inactive.left   = [ [ s:cyan, s:black ], [ s:white, s:black ] ]
"let s:p.insert.left     = [ [ s:black, s:green ], [ s:cyan, s:gray ] ]
"let s:p.replace.left    = [ [ s:black, s:red ], [ s:cyan, s:gray ] ]
"let s:p.visual.left     = [ [ s:black, s:orange ], [ s:cyan, s:gray ] ]
"let s:p.normal.middle   = [ [ s:white, s:gray ] ]
"let s:p.inactive.middle = [ [ s:white, s:gray ] ]
""let s:p.tabline.left    = [ [ s:darkblue, s:gray ] ]
"let s:p.tabline.left    = [ [ s:gray249, s:darkblue ] ]
""let s:p.tabline.tabsel  = [ [ s:cyan, s:black ] ]
"let s:p.tabline.tabsel  = copy(s:p.normal.right)
"let s:p.tabline.middle  = [ [ s:darkblue, s:gray ] ]
"let s:p.tabline.right   = copy(s:p.normal.right)
"let s:p.normal.error    = [ [ s:red, s:black ] ]
"let s:p.normal.warning  = [ [ s:yellow, s:black ] ]
"
"let g:lightline#colorscheme#myDracula#palette = lightline#colorscheme#flatten(s:p)
"
