if has('mac')
    au FileType plantuml command! OpenUml :!open -a "/Applications/Google Chrome.app" %
elseif has('unix')
    au FileType plantuml command! OpenUml :!open -a "/Applications/Google Chrome.app" %
endif
let g:plantuml_executable_script="~/.config/plantuml/plantuml"

