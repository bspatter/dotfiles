# Setup fzf
# ---------
if [[ ! "$PATH" == */home/awesome/dotfiles/fzf/fzf/bin* ]]; then
  export PATH="$PATH:/home/awesome/dotfiles/fzf/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/awesome/dotfiles/fzf/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/awesome/dotfiles/fzf/fzf/shell/key-bindings.zsh"

