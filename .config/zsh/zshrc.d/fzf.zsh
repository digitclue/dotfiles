# Open in tmux popup if on tmux, otherwise use --height mode
export FZF_DEFAULT_OPTS='--height 40% --tmux center,80%,70% --layout reverse --style full'

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments ($@) to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'lsd --color always --icon always --group-dirs=first --tree --depth 1 {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}

fzf-insert-env() {
  local var_name=$(printenv | cut -d= -f1 | sort | fzf \
    --preview 'printenv {}')

  if [[ -n "$var_name" ]]; then
    LBUFFER="${LBUFFER}\$${var_name}"
  fi
  
  zle reset-prompt
}

zle -N fzf-insert-env
bindkey '^E' fzf-insert-env

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

