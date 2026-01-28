# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export LANG=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  brew
  colorize
  nvm
  pyenv
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export PATH=$HOME/.local/bin:$PATH

# Brew
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# JetBrains
export PATH=$HOME/.jetbrains/bin:$PATH

# Carapace
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

# Cursor
# ~/.zshrc — disable Powerlevel10k when Cursor Agent runs
if [[ -n "$CURSOR_AGENT" ]]; then
  # Skip theme initialization for better compatibility
else
  [[ -r ~/.p10k.zsh ]] && source ~/.p10k.zsh
fi

# Neovim
export EDITOR="$(which nvim)"
export VISUAL="$(which nvim)"

# Aliases
alias vi="nvim"
alias vim="nvim"
alias reload="source ~/.zshrc"
alias ls="lsd -F --group-dirs=first"
alias la="lsd -AF"
alias ll="lsd -lAF --group-dirs=first"
alias tree="lsd -F --tree"
alias lg="lazygit"

# Functions
touch2() { mkdir -p "$(dirname "$1")" && touch "$1" }

# Antigravity
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

# Extra configuration
[[ -r $HOME/.zshrc-extra ]] && source $HOME/.zshrc-extra
