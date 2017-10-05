" =============================================================================
" Filename: autoload/lightline/colorscheme/mymolokai.vim
" Author: KUDO Shunsuke
" License: MIT License
" =============================================================================
"
"                    GUI       CUI
let s:black     = [ '#232526', 233 ]
let s:gray      = [ '#808080', 244 ]
let s:gray238   = [ '#444444', 238 ]
let s:white     = [ '#eeeeee', 255 ]
let s:cyan      = [ '#66d9ef', 81 ]
let s:green     = [ '#a6e22e', 118 ]
let s:orange    = [ '#ef5939', 166 ]
let s:orange215 = [ '#ef5939', 215 ]
let s:pink      = [ '#f92672', 161 ]
let s:red       = [ '#ff0000', 160 ]
let s:yellow    = [ '#e6db74', 229 ]
let s:blue      = [ '#005fd7', 27]
let s:darkblue  = [ '#005fd7', 17]
let s:purple13  = [ '#005fd7', 13]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left       = [ [ s:black, s:cyan            ], [ s:cyan, s:black            ] ]
let s:p.normal.middle     = [ [ s:white, s:gray238            ] ]
let s:p.normal.right      = [ [ s:black, s:purple13, 'bold' ], [ s:black, s:purple13, 'bold' ] ]
let s:p.normal.error      = [ [ s:pink, s:black            ] ]
let s:p.normal.warning    = [ [ s:yellow, s:black          ] ]
let s:p.insert.left       = [ [ s:black, s:green           ], [ s:green, s:black ] ]
let s:p.visual.left       = [ [ s:black, s:yellow          ], [ s:yellow, s:black ] ]
let s:p.replace.left      = [ [ s:black, s:red             ], [ s:red, s:black ] ]
let s:p.inactive.left     = [ [ s:gray, s:black            ], [ s:gray, s:black ] ]
let s:p.inactive.middle   = [ [ s:gray, s:darkblue         ] ]
let s:p.inactive.right    = [ [ s:white, s:gray238, 'bold' ], [ s:white, s:gray238, 'bold' ] ]
let s:p.tabline.left      = [ [ s:pink, s:black            ] ]
let s:p.tabline.middle    = [ [ s:pink, s:black            ] ]
let s:p.tabline.right     = copy(s:p.normal.right)
let s:p.tabline.tabsel    = [ [ s:black, s:pink            ] ]

let g:lightline#colorscheme#mymolokai#palette = lightline#colorscheme#flatten(s:p)
