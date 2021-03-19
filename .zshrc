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
	antigen bundle pndurette/zsh-lux
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

export LUX_ITERM_ALL_LIGHT="SolarizedLight"
export LUX_ITERM_ALL_DARK="SolarizedDark"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

eval "$(starship init zsh)"

if macos_is_dark; then
		lux iterm dark
		export BAT_THEME="Solarized (dark)"
else
		lux iterm light
		export BAT_THEME="Solarized (light)"
fi
