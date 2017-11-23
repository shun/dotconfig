if has('mac')
    au FileType plantuml command! OpenUml :!open -a "/Applications/Google Chrome.app" %
elseif has('unix')
    au FileType plantuml command! OpenUml :!xdg-open %
endif

