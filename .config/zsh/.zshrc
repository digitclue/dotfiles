# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lazy-load (autoload) Zsh function files from a directory.
ZFUNCDIR=$ZDOTDIR/zfunctions
fpath=($ZFUNCDIR $fpath)
autoload -Uz $ZFUNCDIR/*(.:t)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  colorize
  pyenv
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Zsh autosuggestions
# source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Zsh syntax highlighting
# source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Neovim
export EDITOR="$(which nvim)"
export VISUAL="$(which nvim)"

# Load every .zsh file in the .zshrc.d directory
if [ -d "$ZDOTDIR/zshrc.d" ]; then
  for file in "$ZDOTDIR/zshrc.d"/*.zsh; do
    source "$file"
  done
fi

