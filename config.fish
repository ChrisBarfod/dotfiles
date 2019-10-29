# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

# Aliases
## Git Aliases
alias g='git'
alias gl='git log'
alias glg='git log --graph --oneline --decorate'
alias glo='git log --oneline'
alias ga='git add'
alias gc='git commit'
alias gi='git init'
alias gs='git status -sb'
alias gb='git branch'
alias gchk='git checkout'
alias gm='git merge'
alias gcl='git clone'
alias gp='git push'
alias gr='git remote'	

## Unix Commands
alias ls="ls -G"
alias la='ls -A'
alias ll='ls -l'

set fish_greeting # Remove fish greeting

# Set Starship as prompt for fish - this stays at end of file!
eval (starship init fish)
