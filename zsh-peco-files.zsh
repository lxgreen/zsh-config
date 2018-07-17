function peco-directories() {
    local current_buffer=$BUFFER
    if command -v fd >/dev/null 2>&1; then
      local dir="$(command fd --type directory --hidden --no-ignore --exclude .git/ --color never | peco )"
    else
      local dir="$(
        command find \( -path '*/\.*' -o -fstype dev -o -fstype proc \) -type d -print 2> /dev/null \
        | sed 1d \
        | cut -b3- \
        | awk '{a[length($0)" "NR]=$0}END{PROCINFO["sorted_in"]="@ind_num_asc"; for(i in a) print a[i]}' - \
        | peco
      )"
    fi

    if [ -n "$dir" ]; then
      dir=$(echo "$dir" | tr -d '\n')
      dir=$(printf %q "$dir")

      BUFFER="${current_buffer}${dir}"
      CURSOR=$#BUFFER
    fi
  }

  function peco-files() {
    local current_buffer=$BUFFER
    if command -v fd >/dev/null 2>&1; then
      local file="$(command fd --type file --hidden --no-ignore --exclude .git/ --color never | peco)"
    elif command -v rg >/dev/null 2>&1; then
      local file="$(rg --glob "" --files --hidden --no-ignore-vcs --iglob !.git/ --color never | peco)"
    elif command -v ag >/dev/null 2>&1; then
      local file="$(ag --files-with-matches --unrestricted --skip-vcs-ignores --ignore .git/ --nocolor -g "" | peco)"
    else
      local file="$(
      command find \( -path '*/\.*' -o -fstype dev -o -fstype proc \) -type f -print 2> /dev/null \
        | sed 1d \
        | cut -b3- \
        | awk '{a[length($0)" "NR]=$0}END{PROCINFO["sorted_in"]="@ind_num_asc"; for(i in a) print a[i]}' - \
        | peco
      )"
    fi

    if [ -n "$file" ]; then
      file=$(echo "$file" | tr -d '\n')
      file=$(printf %q "$file")
      BUFFER="${current_buffer}${file}"
      CURSOR=$#BUFFER
    fi
  }

  zle -N peco-directories
  bindkey '^Xf' peco-directories
  zle -N peco-files
  bindkey '^X^f' peco-files
