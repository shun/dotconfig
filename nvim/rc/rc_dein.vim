" dein Scripts ------------------------------

let s:rc_dir = expand($XDG_CONFIG_HOME . '/nvim/rc')
let s:cache_dir = expand($XDG_CACHE_HOME . '/nvim')

let s:dein_dir = s:cache_dir . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
	execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

let g:dein#install_log_filename = '/tmp/dein.log'
if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

	let s:toml = s:rc_dir . '/dein.toml'
	let s:lazy_toml = s:rc_dir . '/dein_lazy.toml'

	call dein#load_toml(s:toml, {'lazy' : 0})
	call dein#load_toml(s:lazy_toml, {'lazy' : 0})

	call dein#end()
	call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

