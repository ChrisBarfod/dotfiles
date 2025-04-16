# =============================================================================
#                                   Variables
# =============================================================================
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export TERM="xterm-256color"

# asdf package manager
autoload -Uz compinit && compinit
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# eval "$(fasd --init auto)" ## - think about adding later

zmodload zsh/zprof

# Move next only if `homebrew` is installed
if command -v brew >/dev/null 2>&1; then
	# Load rupa's z if installed
	[ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

# TODO install this at home (make automatic)
#source /usr/local/etc/profile.d/z.sh
source $HOME/.zsh_profile

# =============================================================================
#                                   Zplugins
# =============================================================================
# https://github.com/zplug/zplug
# to enable fzy search

source ~/.zplug/init.zsh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "plugins/git", from:oh-my-zsh
# zplug "plugins/command-not-found", from:oh-my-zsh
# zplug "plugins/colored-man-pages", from:oh-my-zsh
# zplug "plugins/colorize", from:oh-my-zsh
zplug "b4b4r07/enhancd", use:init.sh
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
zplug "plugins/vi-mode", from:oh-my-zsh
# zplug "plugins/dircycle", from:oh-my-zsh
zplug "seebi/dircolors-solarized", ignore:"*", as:plugin
zplug "plugins/fasd", from:oh-my-zsh


# =============================================================================
#                                   Options
# =============================================================================

setopt autocd                   # Allow changing directories without `cd`
setopt append_history           # Dont overwrite history
setopt extended_history         # Also record time and duration of commands.
setopt share_history            # Share history between multiple shells
setopt hist_expire_dups_first   # Clear duplicates when trimming internal hist.
setopt hist_find_no_dups        # Dont display duplicates during searches.
setopt hist_ignore_dups         # Ignore consecutive duplicates.
setopt hist_ignore_all_dups     # Remember only one unique copy of the command.
setopt hist_reduce_blanks       # Remove superfluous blanks.
setopt hist_save_no_dups        # Omit older commands in favor of newer ones.
# setopt auto_pushd
setopt pushd_ignore_dups        # Dont push copies of the same dir on stack.
setopt pushd_minus              # Reference stack entries with "-".
setopt extended_glob

#ENHANCD_FILTER=fzy
#export ENHANCD_FILTER 

# Silver Searcher - integration with fzf
#export FZF_DEFAULT_COMMAND='ag --ignore *.pyc -g ""'
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# =============================================================================
#                                   Zstyle
# =============================================================================

zstyle ':completion:*' rehash true
#zstyle ':completion:*' verbose yes
#zstyle ':completion:*:descriptions' format '%B%d%b'
#zstyle ':completion:*:messages' format '%d'
#zstyle ':completion:*:warnings' format 'No matches for: %d'
#zstyle ':completion:*' group-name ''
# case-insensitive (all), partial-word and then substring completion
zstyle ":completion:*" matcher-list \
  "m:{a-zA-Z}={A-Za-z}" \
  "r:|[._-]=* r:|=*" \
  "l:|=* r:|=*"
zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS}

# =============================================================================
#                                    Aliases
# =============================================================================

# Next highest folder with .git
alias tl='git rev-parse --show-toplevel'

# Git Aliases
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

# Unix Commands
alias ls="ls -G"
alias la='ls -A'
alias ll='ls -l'
alias tf='tail -f'
#alias -g G='| grep --color'
alias grep='() { $(whence -p grep) --color=auto $@ }'
alias egrep='() { $(whence -p egrep) --color=auto $@ }'

export KEYTIMEOUT=1

export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# eval `gdircolors ~/.dir_colors`



# =============================================================================
#                             Final Initiations
# =============================================================================

# Install Plugins
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi



# Then, source plugins and add commands to $PATH
zplug load # --verbose

# Syntax Highlighting
if zplug check "zsh-users/zsh-syntax-highlighting"; then
	#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'
	ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
	ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')
	typeset -A ZSH_HIGHLIGHT_STYLES
	ZSH_HIGHLIGHT_STYLES[cursor]='bg=yellow'
	ZSH_HIGHLIGHT_STYLES[globbing]='none'
	ZSH_HIGHLIGHT_STYLES[path]='fg=white'
	ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=grey'
	ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan'
	ZSH_HIGHLIGHT_STYLES[builtin]='fg=cyan'
	ZSH_HIGHLIGHT_STYLES[function]='fg=cyan'
	ZSH_HIGHLIGHT_STYLES[command]='fg=green'
	ZSH_HIGHLIGHT_STYLES[precommand]='fg=green'
	ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green'
	ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=yellow'
	ZSH_HIGHLIGHT_STYLES[redirection]='fg=magenta'
	ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=cyan,bold'
	ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=green,bold'
	ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=magenta,bold'
	ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=yellow,bold'
fi

# History Search
if zplug check "zsh-users/zsh-history-substring-search"; then
	zmodload zsh/terminfo
	bindkey "$terminfo[kcuu1]" history-substring-search-up
	bindkey "^[[1;5A" history-substring-search-up
	bindkey "$terminfo[kcud1]" history-substring-search-down
	bindkey "^[[1;5B" history-substring-search-down
fiplugins=(fasd)
fi	

export PATH="$PATH:/path/to/elixir/bin"


#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Set Starship as prompt for zsh - this stays at end of file!
eval "$(starship init zsh)"
