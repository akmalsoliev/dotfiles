if status is-interactive
  # Activate virtual env and save the path as a tmux variable,
  # so that new panes/windows can re-activate as necessary
  if test -d .venv
    source .venv/bin/activate.fish
  end

  set -gx TMUX_CONFIG $HOME/.config/tmux/tmux.config
  # Create XDG_CONFIG_HOME
  set -gx XDG_CONFIG_HOME $HOME/.config

  # Adding paths
  fish_add_path /Users/$USER/.local/bin
  fish_add_path /Users/$USER/.cache/lm-studio/bin
  fish_add_path /opt/homebrew/sbin
  fish_add_path $(go env GOPATH)/bin

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
  alias cls='clear'

  # Neovim aliase
  alias vim='nvim'
  alias ovim='nvim .'

  # glow default theme
  alias glow="glow -s /Users/akmalsoliev/Library/Preferences/glow/nord.json"

  alias tf="terraform"
  alias pd="podman"

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

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/akmalsoliev/.cache/lm-studio/bin
# End of LM Studio CLI section
