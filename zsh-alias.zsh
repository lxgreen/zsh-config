alias acl="cd ~/photography/albums-client-lib"
alias ass="cd ~/photography/albums-statics"
alias org="cd ~/photography/organize-media"
alias pro="cd ~/photography/pro-gallery-statics"
alias wbu="cd ~/wix-base-ui"
alias gsp="grunt serve --production"
alias yrr="yarn pretest && ~/relink_albums.sh"
alias rr="~/photography/rebuild_relink.sh && npm run watch"

alias rce="cd ~/rich-content/packages/editor"
alias rcee="cd ~/rich-content/packages/editor-example"
alias styc="cd ~/stylable-components"

alias hass="ssh root@192.168.1.113 -i /Users/alexgr/hassio/ssh_mac/id_rsa"
alias hassr="ssh root@lxgreen.duckdns.org -i /Users/alexgr/hassio/ssh_mac/id_rsa"

alias zr="source ~/.zshrc"
alias zshrc="code ~/.zshrc ~/.zsh"

alias sim="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias gg="gsta && gup"

alias lf="ll | peco"
alias glogp="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all | peco"
alias glog="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gad="git ls-files --modified --others --exclude-standard | peco --initial-filter=Fuzzy | xargs git add --"
alias gdif="git diff --name-only HEAD | peco --initial-filter=Fuzzy | xargs git diff HEAD --"
