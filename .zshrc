[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/dev/zsh-config/antigen-plugins.zsh

find-up() {
	path=$(pwd)
	while [[ "$path" != "" && ! -e "$path/$1" ]]; do
		path=${path%/*}
	done
	echo "$path"
}

eval "$(fnm env)"

FNM_USING_LOCAL_VERSION=0

autoload -U add-zsh-hook
_fnm_autoload_hook() {
	nvmrc_path=$(find-up .nvmrc | tr -d '[:space:]')

	if [ -n "$nvmrc_path" ]; then
		FNM_USING_LOCAL_VERSION=1
		nvm_version=$(cat $nvmrc_path/.nvmrc)
		fnm use $nvm_version
	elif [ $FNM_USING_LOCAL_VERSION -eq 1 ]; then
		FNM_USING_LOCAL_VERSION=0
		fnm use default
	fi
}

add-zsh-hook chpwd _fnm_autoload_hook && _fnm_autoload_hook

export ZK_NOTEBOOK_DIR="~/Sync/Notes"
export TERM="xterm-256color"
export BAT_THEME="gruvbox-dark"
export PATH="$HOME/.cargo/bin:/usr/bin/python:/usr/local/opt/ruby/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export EDITOR="nvim"
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export RANGER_LOAD_DEFAULT_RC=FALSE

export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"


# Returns whether the given command is executable or aliased.
_has() {
  return $( whence $1 >/dev/null )
}


if _has fzf + _has fd; then
    export FZF_DEFAULT_OPTS="--extended"
    export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
    export FZF_DEFAULT_COMMAND='fd --type f'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers,changes --color=always {} | head -100'"
    export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
fi


function switch_alacritty_theme() {
  local currenttheme=$(cat $HOME/.config/current_theme)
  if [[ "$currenttheme" = "dark" ]]; then
    # sed -i '' "s/colors:\ \*dark/colors: *light/g" ~/.config/alacritty/alacritty.yml
    alacritty-themes Gruvbox-Light
    export COLOR_SCHEME="light"
    echo light > $HOME/.config/current_theme
    export BAT_THEME="gruvbox-light"
  else
    # sed -i '' "s/colors:\ \*light/colors: *dark/g" ~/.config/alacritty/alacritty.yml
    alacritty-themes Gruvbox-Dark
    export COLOR_SCHEME="dark"
    export BAT_THEME="gruvbox-dark"
    echo dark > $HOME/.config/current_theme
  fi
  ~/dev/zsh-config/reload_nvim.zsh
}

# zle -N switch_alacritty_theme
# bindkey '^T' switch_alacritty_theme

_zsh_cli_fg() { fg; }
zle -N _zsh_cli_fg
bindkey '^Z' _zsh_cli_fg

# caching for telescope repo relies on findutils/glocate
# https://egeek.me/2020/04/18/enabling-locate-on-osx/
if which glocate > /dev/null; then
  alias locate="glocate -d $HOME/locatedb"

  # Using cache_list requires `LOCATE_PATH` environment var to exist in session.
  # trouble shoot: `echo $LOCATE_PATH` needs to return db path.
  [[ -f "$HOME/locatedb" ]] && export LOCATE_PATH="$HOME/locatedb"
fi

alias loaddb="gupdatedb --localpaths=$HOME/dev --output=$HOME/locatedb"

source ~/dev/zsh-config/zsh-alias.zsh
eval "$(starship init zsh)"
alacritty-themes Gruvbox-Dark

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
