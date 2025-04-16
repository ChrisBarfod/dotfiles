## Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

# Utilities
function g        ; git $argv ; end
function grep     ; command grep --color=auto $argv ; end

# Git
alias g='git'
alias gl='git log'
alias glg='git log --graph --oneline --decorate'
alias glo='git log --oneline'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gi='git init'
alias gs='git status -sb'
alias gb='git branch'
alias gchk='git checkout'
alias gm='git merge'
alias gcl='git clone'
alias gp='git push'
alias gr='git remote'

# Unix Commands
alias ls="ls -G"
alias la='ls -A'
alias ll='ls -l'

# Shortcuts
alias v="nvim"
alias emacs="emacsclient -n -a emacs"
