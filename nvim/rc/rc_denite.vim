call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')

nmap <silent> <Space>m :<C-u>Denite file_mru<CR>
nmap <silent> <Space>r :<C-u>Denite file_rec<CR>
nmap <silent> <Space>l :<C-u>Denite line<CR>
nmap <silent> <Space>b :<C-u>Denite buffer<CR>
nmap <silent> <Space>g :<C-u>Denite grep<CR>
