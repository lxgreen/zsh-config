# zsh
alias zr="source ~/.zshrc"
alias zshrc="nvim ~/dev/zsh-config/"

#files
alias rmf="rm -rf"

# npm
alias regpub="npm config set registry https://registry.npmjs.org"
alias regwix="npm config set registry http://npm.dev.wixpress.com"
#vm
alias and_emu="~/Library/Android/sdk/emulator/emulator"
alias avd='(and_emu -netdelay none -netspeed full -avd Pixel_2_API_28 > $HOME/.android-avd.log &)'
alias sim="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias avdw='(and_emu -netdelay none -netspeed full -avd Pixel_2_API_28 -writable-system > $HOME/.android-avd.log &)'
alias adb="~/Library/Android/sdk/platform-tools/adb"

#yarn
alias yys="yarn && yarn start"
alias ys="yarn start"
alias yl="yarn link"
alias yld="rm -rf ~/.config/yarn/link/"
alias ya="yarn add"
alias ye="yarn e2e"
alias yb="yarn build"
alias yyb="yarn && yarn build"
alias yaw="yarn add -W"
alias yt="yarn test"

#apps
alias firefox='function _fox(){ (cd /Applications/Firefox\ Developer\ Edition.app/Contents/MacOS && ./firefox $1) }; _fox $1'
alias firefox_hardened='function _hfox(){ (cd /Applications/Firefox\ Developer\ Edition.app/Contents/MacOS && ./firefox -new-instance -P hardened $1) }; _hfox $1'
alias ff='firefox NUL &'
alias fh='firefox_hardened NUL &'
alias nvim='NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim'
alias nvr='NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvr'
alias nn='nvim -u ~/.config/nvim/init.vim -S `pwd`/Session.vim'
alias tt='tmux new -A -s rich-content'
alias tn='tmux new -A -s neovim-ricos'
alias ta='tmux a -t rich-content'
alias zz='tmux new -A -s zettlekasten'
alias tls='tmux list-sessions'
alias pw='keepassxc-cli show ~/IDrive-Sync/Documents/keepass/pw.kdbx'
alias man='batman'
alias cat='bat'
alias bi="brew install"
alias bu="brew uninstall"
alias bl="brew list"
alias ev='function _calc(){ node -e "console.log($1)" };_calc $1'
alias ww='w3m -no-mouse'
alias -g CL="| xargs wc -l"
alias ll='exa -lah --git'
if [ -n "$(alias fd)" ]; then
  unalias fd
fi

#git
alias g='git'
alias gup='git pull --rebase'
alias gco='git checkout'
alias gcm='git checkout master'
alias gcb='git checkout -b'
alias gm='git merge'
alias gcmsg='git commit -m'
alias gf='git fetch'
alias gcl='git clone'
alias gmm='gcm && gup && gco - && gm master'
alias gcmrg='function _merge(){ git commit -m "Merge branch master into $1" };_merge `git branch --show-current`'
alias gcmrgn='function _merge(){ git commit -m "Merge branch master into $1" -n };_merge `git branch --show-current`'

# fuzzy
alias gde='~/dev/zsh-config/gde'
