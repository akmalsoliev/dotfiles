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
# cli aliases
alias cl='clear'
# git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
# Neovim aliase
alias vim='nvim'
alias ovim='nvim .'

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
