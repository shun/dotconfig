function fish_prompt
    set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')
    echo -e ''
    echo -n (whoami)'@'(hostname)':'(prompt_pwd)' {'"$git_branch"'}'
    echo -e '\n$ '
end

