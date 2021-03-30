# FILE=$HOME/.zsh_config_done

# if [ ! -f "$FILE" ]; then
  # touch $HOME/.zsh_config_done
  source ~/zsh-config/antigen.zsh
  antigen use oh-my-zsh
  antigen theme minimal
  antigen bundle fasd
  antigen bundle git
  antigen bundle branch
  antigen bundle colored-man-pages
  antigen bundle colorize
  antigen bundle command-not-found
  antigen bundle common-aliases
  antigen bundle psprint/zsh-navigation-tools
  antigen bundle MichaelAquilina/zsh-you-should-use
  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen bundle jeffreytse/zsh-vi-mode
  antigen apply
# fi


source ~/zsh-config/zsh-alias.zsh

find-up() {
	path=$(pwd)
	while [[ "$path" != "" && ! -e "$path/$1" ]]; do
		path=${path%/*}
	done
	echo "$path"
}

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

add-zsh-hook chpwd _fnm_autoload_hook &&
	_fnm_autoload_hook

export TERM="xterm-256color"
export BAT_THEME="Solarized (dark)"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export EDITOR="nvim"
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export RANGER_LOAD_DEFAULT_RC=FALSE
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Returns whether the given command is executable or aliased.
_has() {
  return $( whence $1 >/dev/null )
}


if _has fzf + _has fd; then
    export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
    export FZF_DEFAULT_COMMAND='fd --type f'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers,changes --color=always {} | head -100'"
    export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
fi

eval "$(starship init zsh)"

currenttime=$(date +%H:%M)
if [[ "$currenttime" > "18:00" ]] || [[ "$currenttime" < "06:00" ]]; then
    sed -i '' "s/colors:\ \*light/colors: *dark/g" ~/.config/alacritty/alacritty.yml
    export COLOR_SCHEME="dark"
    export BAT_THEME="Solarized (dark)"
    echo dark > $HOME/.config/current_theme
else
    sed -i '' "s/colors:\ \*dark/colors: *light/g" ~/.config/alacritty/alacritty.yml
    export COLOR_SCHEME="light"
    export BAT_THEME="Solarized (light)"
    echo light > $HOME/.config/current_theme
fi

function switch_alacritty_theme() {
  local currenttheme=$(cat $HOME/.config/current_theme)
  if [[ "$currenttheme" = "dark" ]]; then
    sed -i '' "s/colors:\ \*dark/colors: *light/g" ~/.config/alacritty/alacritty.yml
    export COLOR_SCHEME="light"
    echo light > $HOME/.config/current_theme
    export BAT_THEME="Solarized (light)"
  else
    sed -i '' "s/colors:\ \*light/colors: *dark/g" ~/.config/alacritty/alacritty.yml
    export COLOR_SCHEME="dark"
    export BAT_THEME="Solarized (dark)"
    echo dark > $HOME/.config/current_theme
  fi
  ~/zsh-config/reload_nvim.zsh
  }
