# disable Powerlevel10k when Cursor Agent runs
if [[ -n "$CURSOR_AGENT" ]]; then
  # Skip theme initialization for better compatibility
else
  [[ -r ~/.p10k.zsh ]] && source ~/.p10k.zsh
fi
