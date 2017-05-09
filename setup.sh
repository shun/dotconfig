# setup the configuration files


paths=("fish" "nvim" "pt" "ranger")

for mypath in ${paths[@]}; do
    if [ ! -d ~/.config/$mypath  ]; then
        ln -s $PWD/$mypath ~/.config/$mypath
        echo "[OK] linked '~/.config/$mypath'"
    else
        echo "[NG] '~/.config/$mypath' exist"
    fi
done

paths=("tigrc" "inputrc" "tmux.conf" "myprofile")

for mypath in ${paths[@]}; do
    if [ ! -e ~/.$mypath  ]; then
        ln -s $PWD/$mypath/.$mypath ~/.$mypath
        echo "[OK] linked '~/.$mypath'"
    else
        echo "[NG] '~/.$mypath' exist"
    fi
done
