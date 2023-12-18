if status is-interactive

if status is-interactive
and not set -q TMUX
    exec tmux
end

export PATH="/Users/akmalsoliev/.local/bin:$PATH"

# lsd aliases
alias ls='lsd -Fl'
alias la='lsd -Fla'
alias lt='lsd --tree'
alias l1='lsd -1'
# cli aliases
alias clr='clear'
# git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
# Neovim aliase
alias vim='nvim'
alias ovim='nvim .'
# upgrading all outdated pip packages
alias pipup="pip freeze | sed 's/=.*//' | xargs pip install --upgrade"
# uninstall all pip 
alias pipuninstall="pip freeze | sed 's/=.*//' | xargs pip uninstall -y"
# glow default theme
alias glow="glow -s /Users/akmalsoliev/Library/Preferences/glow/nord.json"

# docker-compose alias
alias dco="docker-compose"

# Cargo aliases
alias cr="cargo run"
alias ca="cargo add"
alias cc="cargo check"

set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes

set -g theme_color_scheme nord

pyenv init - | source

# Removes date from the right side of the command line
# intentional, because have everything in the tmux statusline
function fish_right_prompt
  #intentionally left blank
 end

end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

