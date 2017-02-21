let g:quickrun#default_config = {}
let g:quickrun_config = {}

let g:quickrun_config={'_': {
\       'runner' : 'vimproc',
\       'runner/vimproc/updatetime' : 50,
\       'outputter' : 'quickfix',
\       'outputter/quickfix/open_cmd' : 'copen',
\       'outputter/buffer/running_mark' : '### running quickrun... ###',
\}
\}

let g:quickrun_config.cpp={
\       'command' : 'clang++-3.8',
\       'cmdopt' : '-stdlib=libc++ -std=c++11',
\       "hook/add_include_option/enable"   : 1,
\       'outputter' : 'buffer',
\       'outputter/buffer/split' : 'virtical botright 12sp',
\       'outputter/buffer/close_on_empty' : 0,
\       "exec" : ["%c %o %s %a -o %s:p:r", '%s:p:r %a'],
\}

let g:quickrun_config.go = {
\       'command': 'run',
\       'cmdopt' : '',
\       'exec': ['go %c %s %o -'],
\       'outputter' : 'buffer',
\       'outputter/buffer/split' : 'vertical botright 80',
\       'outputter/buffer/close_on_empty' : 1,
\ }

let g:quickrun_config.python = {
\       'command': 'python3',
\       'cmdopt' : '',
\       'exec': ['%c %s %o -'],
\       'outputter' : 'buffer',
\       'outputter/buffer/split' : 'botright 20',
\       'outputter/buffer/close_on_empty' : 0,
\ }
