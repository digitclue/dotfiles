export LANG=en_US.UTF-8

# XDG Base Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"

# Less (pager on MacOS)
export LESSHISTFILE="$XDG_DATA_HOME/less/history"

# Nvm
export NVM_DIR="$XDG_DATA_HOME/nvm"

# Zoxide
export _ZO_DATA_DIR="$XDG_DATA_HOME/zoxide"

