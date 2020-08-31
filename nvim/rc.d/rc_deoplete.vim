autocmd CompleteDone * silent! pclose!

call deoplete#custom#source('around', 'rank', 1)

let g:deoplete#enable_at_startup = 1

