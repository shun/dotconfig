set fish_color_autosuggestion a0d8ef

# Path
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export EDITOR=nvim
export GOPATH=$HOME/.go
export RANGERDIR=/usr/local/opt/ranger/libexec/ranger
export GOROOT=/usr/local/opt/go/libexec
set PATH $PATH $GOROOT/bin
set PATH $PATH $GOPATH/bin

# Aliases
alias vi="nvim"
alias ll="ls -la"
alias l="ls -a"
alias lpc="ll | peco"
alias sudo="sudo -E"
#set fish_function_path $fish_function_path "$HOME/Library/Python/2.7/lib/python/site-packages/powerline/bindings/fish"
#powerline-setup

bind \cd 'exit'
source ~/.config/fish/functions/fish_prompt.fish

#peco
function fish_user_key_bindings
    bind \cr peco_select_history
end

