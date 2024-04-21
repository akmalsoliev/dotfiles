if status is-interactive

# Activate venv
function sv
    source .venv/bin/activate.fish
    and tmux set-environment VIRTUAL_ENV $VIRTUAL_ENV
end
if test -n "$VIRTUAL_ENV"
    source $VIRTUAL_ENV/bin/activate.fish
end

# iterm integration
source ~/.iterm2_shell_integration.fish

if status is-interactive
and not set -q TMUX
    exec tmux
end

export PATH="/Users/$USER/.local/bin:$PATH"

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
alias pipuninstall="pip3 list --format freeze | sed 's/=.*//' | xargs pip3 uninstall -y"
# glow default theme
alias glow="glow -s /Users/akmalsoliev/Library/Preferences/glow/nord.json"

# Cargo aliases
alias cr="cargo run"
alias ca="cargo add"
alias cc="cargo check"

set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes

set -g theme_color_scheme nord

# pyenv
pyenv init - | source

# direnv
direnv hook fish | source
set -g direnv_fish_mode eval_on_arrow

# Removes date from the right side of the command line
# intentional, because have everything in the tmux statusline
function fish_right_prompt
  #intentionally left blank
 end

end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
