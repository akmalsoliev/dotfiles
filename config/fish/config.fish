if status is-interactive
  # Activate virtual env and save the path as a tmux variable,
  # so that new panes/windows can re-activate as necessary
  if test -d .venv
    source .venv/bin/activate.fish
  end

  # iterm integration
  test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

  # iterm integration
  source ~/.iterm2_shell_integration.fish

  if status is-interactive
    and not set -q TMUX
    exec tmux
  end

  export PATH="/Users/$USER/.local/bin:$PATH"

  # lsd aliases
  alias ls='lsd'
  alias lf='lsd -Fl'
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

  # glow default theme
  alias glow="glow -s /Users/akmalsoliev/Library/Preferences/glow/nord.json"

  set -g theme_powerline_fonts no
  set -g theme_nerd_fonts yes

  # direnv
  direnv hook fish | source

  # Removes date from the right side of the command line
  # intentional, because have everything in the tmux statusline
  function fish_right_prompt
    #intentionally left blank
  end

end
uv generate-shell-completion fish | source
