if [[ -f "/opt/homebrew/bin/brew" ]] then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Exporting path
export PATH="/Users/$USER/.local/bin:$PATH"

# Start starship
eval "$(starship init zsh)"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::autoenv
zinit snippet OMZP::aws
zinit snippet OMZP::command-not-found
zinit snippet OMZP::direnv
zinit snippet OMZP::git
zinit snippet OMZP::pj
zinit snippet OMZP::sudo

# Command not found
HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
if [ -f "$HB_CNF_HANDLER" ]; then
source "$HB_CNF_HANDLER";
fi

# pj plugin, commonly used directories
PROJECT_PATHS=(~/Workspace/ ~/Workspace/Engie/ ~/.config/)

# Custom starship 
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
# lsd aliases
alias ls='lsd'
alias ll='lsd -Fl'
alias la='lsd -Fla'
alias lt='lsd --tree'
alias l1='lsd -1'

# cli aliases
alias clr='clear'

# Neovim aliase
alias vim='nvim'
alias ovim='nvim .'

# glow default theme
alias glow="glow -s /Users/akmalsoliev/Library/Preferences/glow/nord.json"

alias ..="cd .."

tmux() {
    command tmux -f "$XDG_CONFIG_HOME/tmux/tmux.conf" "$@"
}

if [[ -z "$TMUX" && "$TERM" != "screen" ]]; then
    exec tmux
fi
