function peco-git-checkout () {
    local selected_branch=$(git branch --list --no-color | colrm 1 2 | peco)
    if [ -n "$selected_branch" ]; then
        BUFFER="git checkout ${selected_branch}"
        zle accept-line
    fi
}
zle -N peco-git-checkout
bindkey "^bco" peco-git-checkout
