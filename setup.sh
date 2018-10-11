# setup the configuration files

paths=(".docker")

for mypath in ${paths[@]}; do
    if [ ! -d ~/$mypath  ]; then
        ln -s $PWD/$mypath ~/$mypath
        echo "[OK] linked '~/$mypath'"
    else
        echo "[NG] '~/$mypath' exist"
    fi
done

paths=("nvim" "pt" "ranger" "terminator" "plantuml")

for mypath in ${paths[@]}; do
    if [ ! -d ~/.config/$mypath  ]; then
        ln -s $PWD/$mypath ~/.config/$mypath
        echo "[OK] linked '~/.config/$mypath'"
    else
        echo "[NG] '~/.config/$mypath' exist"
    fi
done

paths=("tigrc" "inputrc" "tmux.conf" "myprofile" "gitconfig" "globalrc" "xremap" "dircolors" "powerline-shell")

for mypath in ${paths[@]}; do
    files=`ls -A $mypath/`
    for f in $files; do
        if [ ! -e ~/$f  ]; then
            ln -s $PWD/$mypath/$f ~/$f
            echo "[OK] linked '~/.$f'"
        else
            echo "[NG] '~/.$f' exist"
        fi
    done
done

ln -s $PWD/nvim/init.vim $HOME/.vimrc

