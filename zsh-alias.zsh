# photography nav
alias acl="cd ~/photography/albums-client-lib"
alias ass="cd ~/photography/albums-statics"
alias org="cd ~/photography/organize-media"
alias pro="cd ~/photography/pro-gallery-statics"
alias wbu="cd ~/wix-base-ui"
alias gsp="grunt serve --production"
alias yrr="yarn pretest && ~/relink_albums.sh"
alias rr="~/photography/rebuild_relink.sh && npm run watch"

# rce nav
alias rce="cd ~/rich-content/packages/editor"
alias rcee="cd ~/rich-content/examples/editor"
alias styc="cd ~/stylable-components"

# hassio
alias hass="ssh root@192.168.1.113 -i /Users/alexgr/hassio/ssh_mac/id_rsa"
alias hassr="ssh root@lxgreen.duckdns.org -i /Users/alexgr/hassio/ssh_mac/id_rsa"

# zsh
alias zr="source ~/.zshrc"
alias zshrc="code ~/.zshrc ~/.zsh"

# misc
alias sim="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias lf="ll | peco"
alias alp="alias | peco"

# git
alias gg="gsta && gup"
alias glogp="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' | peco"
alias glog="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)'"
alias gad="git ls-files --modified --others --exclude-standard | peco --initial-filter=Fuzzy | xargs git add --"
alias gdif="git diff --name-only HEAD | peco --initial-filter=Fuzzy | xargs git diff HEAD --"

# npm
alias rpl="rm ./package-lock.json"
alias nb="npm run build"
alias nt="npm test"
alias ns="npm start"
alias nib="npm i && npm run build"
alias nis="npm i && npm start"
alias sz="bundle-phobia"
