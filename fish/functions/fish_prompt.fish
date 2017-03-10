function fish_prompt
    set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')
    echo -e ''
    set_color 708090
    echo -n (whoami)'@'
    set_color -o yellow
    echo -n (hostname)
    set_color normal
    set_color 708090
    echo -n ':'(prompt_pwd)' {'"$git_branch"'}'
    set_color normal
    echo -e '\n$ '
end

