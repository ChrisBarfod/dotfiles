# Path to Oh My Fish install.
set -q XDG_DATA_HOME
and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
or set -gx OMF_PATH "$HOME/.local/share/omf"

# Automate installation process of Fisher on new systems
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
source ~/.config/fish/aliases.fish

fish_add_path /opt/homebrew/bin

theme_gruvbox dark medium # Automatically apply theme
set fish_greeting # Remove fish greeting

# Default editor
export EDITOR="emacs"

### PATHS ###
export PATH="$PATH:/path/to/elixir/bin"
export PATH="$PATH:$HOME/Development/MISC/flutter/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$HOME/.emacs.d/bin:$PATH"
source $HOME/.zsh_profile

# Open emacs GUI from terminal instead of in terminal
# alias emacs="/usr/local/Cellar/emacs-mac/emacs-27.2-mac-8.3/Emacs.app/Contents/MacOS/Emacs"
alias emacs='/usr/local/bin/emacs --with-profile'

# Set Starship as prompt for fish - this stays at end of file!
starship init fish | source
#source ~/.asdf/asdf.fish
source /usr/local/opt/asdf/asdf.fish
