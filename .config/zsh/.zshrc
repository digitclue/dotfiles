# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# Neovim
export EDITOR="${commands[nvim]:-vi}"
export VISUAL="${commands[nvim]:-vi}"

# Lazy-load (autoload) Zsh function files from a directory.
ZFUNCDIR=$ZDOTDIR/zfunctions
fpath=($ZFUNCDIR $fpath)
autoload -Uz $ZFUNCDIR/*(.:t)

# Antidote
ANTIDOTE_DIR=$XDG_DATA_HOME/zsh/antidote

# Clone antidote if necessary
if [[ ! -d $ANTIDOTE_DIR ]]; then
  git clone https://github.com/mattmc3/antidote $ANTIDOTE_DIR
fi

source $ANTIDOTE_DIR/antidote.zsh

# Set OMZ variables
# Check Oh My Zsh Wiki for how to set these variables
# https://github.com/ohmyzsh/ohmyzsh/wiki/Settings
export ZSH=$(antidote path ohmyzsh/ohmyzsh)

antidote load

# Load every .zsh file in the .zshrc.d directory
if [ -d "$ZDOTDIR/zshrc.d" ]; then
  for file in "$ZDOTDIR/zshrc.d"/*.zsh; do
    source "$file"
  done
fi

