export LANG=en_US.UTF-8

# Define XDG Base Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Set Zsh directory to an XDG location
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Set NVM's directory to an XDG location
export NVM_DIR="$XDG_DATA_HOME/nvm"

# Ensure path arrays do not contain duplicates.
typeset -gU path fpath

# Set the list of directories that zsh searches for commands.
path=(
  $HOME/{,s}bin(N)
  $HOME/.local/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)
