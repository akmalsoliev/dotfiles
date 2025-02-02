if status is-interactive
  # Activate virtual env and save the path as a tmux variable,
  # so that new panes/windows can re-activate as necessary
  if test -d .venv
    source .venv/bin/activate.fish
  end

  set -gx TMUX_CONFIG $HOME/.config/tmux/tmux.config
  export PATH="/Users/$USER/.local/bin:$PATH"
  set -gx XDG_CONFIG_HOME $HOME/.config

  # pure prompt
  set --universal pure_show_system_time true
  set --universal pure_color_system_time pure_color_mute

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

  set -gx PROJECT_PATHS ~/Workspace/ ~/Workspace/Engie/ ~/.config/

  # direnv
  direnv hook fish | source

  # uv integration
  uv generate-shell-completion fish | source

  # Removes date from the right side of the command line
  # intentional, because have everything in the tmux statusline
  function fish_right_prompt
    #intentionally left blank
  end

  if status is-interactive
    and not set -q TMUX
    exec tmux
  end

end
