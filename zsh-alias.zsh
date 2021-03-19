# hassio
alias hass="ssh root@192.168.1.113 -i /Users/alexgr/hassio/ssh_mac/id_rsa"
alias hassr="ssh root@lxgreen.duckdns.org -i /Users/alexgr/hassio/ssh_mac/id_rsa"

# zsh
alias zr="source ~/.zshrc"
alias zshrc="nvim ~/.zshrc ~/zsh-config/zsh-alias.zsh"

# misc
alias sim="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"

#files
alias rmf="rm -rf"
alias nout="> /dev/null 2>&1"
alias rpl="rm ./package-lock.json"
alias rmnm="rm -rf ./node_modules && rm -f ./yarn.lock && rm -f ./package-lock.json"

# npm
alias nb="npm run build"
alias nt="npm test"
alias ns="npm start"
alias nw="npm run watch"
alias nib="npm i && npm run build"
alias nis="npm i && npm start"
alias niw="npm i && npm run watch"
alias sz="bundle-phobia"
alias nin="npm install"
alias nins="npm install -S"
alias nind="npm install -D"
alias ninf="npm install --force"
alias nbp="npm run build --prefix"
alias nbpc="npm run build --prefix ./packages/common"
alias nbpe="npm run build --prefix ./packages/editor"
alias regpub="npm config set registry https://registry.npmjs.org"
alias regwix="npm config set registry http://npm.dev.wixpress.com"
alias nr="npm run rebuild"
#vm
alias and_emu="~/Library/Android/sdk/emulator/emulator"
alias avd='(and_emu -netdelay none -netspeed full -avd Pixel_2_API_28 > $HOME/.android-avd.log &)'
alias avdw='(and_emu -netdelay none -netspeed full -avd Pixel_2_API_28 -writable-system > $HOME/.android-avd.log &)'
alias adb="~/Library/Android/sdk/platform-tools/adb"

#yarn
alias yarn="midgard-yarn"
alias yys="midgard-yarn && midgard-yarn start"
alias ys="midgard-yarn start"
alias yl="midgard-yarn link"
alias yld="rm -rf ~/.config/yarn/link/"
alias ya="midgard-yarn add"
alias ye="midgard-yarn e2e"
alias yb="midgard-yarn build"
alias yyb="midgard-yarn && midgard-yarn build"
alias yaw="midgard-yarn add -W"
alias yt="midgard-yarn test"

#apps
alias firefox='function _fox(){ (cd /Applications/Firefox\ Developer\ Edition.app/Contents/MacOS && ./firefox $1) }; _fox $1'
alias firefox_hardened='function _hfox(){ (cd /Applications/Firefox\ Developer\ Edition.app/Contents/MacOS && ./firefox -new-instance -P hardened $1) }; _hfox $1'
alias ff='firefox NUL &'
alias fh='firefox_hardened NUL &'
# alias nvim='NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim'
# alias nvr='NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvr'
alias nn='nvim -S'
alias tt='tmux new -A -s rich-content'
alias ta='tmux a -t rich-content'
alias tls='tmux list-sessions'
alias pw='keepassxc-cli show ~/IDrive-Sync/Documents/keepass/pw.kdbx'
alias man='batman'
alias cat='bat'
alias bi="brew install"
alias bu="brew uninstall"
alias bl="brew list"
alias ev='function _calc(){ node -e "console.log($1)" };_calc $1'
alias rr='ranger --cmd "set show_hidden=true"'
alias ww='w3m -no-mouse'
alias -g CL="| xargs wc -l"
alias ll='exa -lah --git'
alias drk='lux iterm dark && ~/zsh-config/reload_nvim.zsh'
alias lit='lux iterm light && ~/zsh-config/reload_nvim.zsh'
if [ -n "$(alias fd)" ]; then
  unalias fd
fi
