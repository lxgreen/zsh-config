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
alias rmnm="rm -rf ./node_modules && rm -f ./yarn.lock && rm -f ./package-lock.json"
alias nb="npm run build"
alias nt="npm test"
alias ns="npm start"
alias nw="npm run watch"
alias nib="npm i && npm run build"
alias nis="npm i && npm start"
alias sz="bundle-phobia"
alias nin="npm install"
alias nins="npm install -S"
alias nind="npm install -D"
alias ninf="npm install --force"
alias and_emu="~/Library/Android/sdk/emulator/emulator"
alias avd='(and_emu -netdelay none -netspeed full -avd Pixel_2_API_28 > $HOME/.android-avd.log &)'
alias avdw='(and_emu -netdelay none -netspeed full -avd Pixel_2_API_28 -writable-system > $HOME/.android-avd.log &)'
alias adb="~/Library/Android/sdk/platform-tools/adb"
alias vm="VBoxManage -q startvm ubuntu"
alias nbp="npm run build --prefix"
alias nbpc="npm run build --prefix ./packages/common"
alias nbpe="npm run build --prefix ./packages/editor"
alias regpub="npm config set registry https://registry.npmjs.org"
alias regwix="npm config set registry http://npm.dev.wixpress.com"
