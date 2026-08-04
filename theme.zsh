#!/usr/bin/env zsh
# ================================================================
# Theme Configuration
# ================================================================
# Handles Starship Prompt, FZF theming, and Syntax Highlighting

# ------------------------------------------------
# 1. Starship Prompt
# ------------------------------------------------
if command -v starship &>/dev/null; then
    export STARSHIP_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/starship"
    eval "$(starship init zsh)"
else
    PROMPT='%F{green}%n%f:%F{blue}%~%f %# '
fi

# ------------------------------------------------
# 2. Syntax Highlighting Theme Loader
# ------------------------------------------------
# Reads the shared theme selection written by `theme-set` (functions/theme.zsh).
# Neovim's colorscheme.lua reads this exact same file, so `theme-set <name>`
# keeps the shell and editor in sync -- Neovim picks it up on its next launch,
# this shell picks it up immediately below.
typeset _current_theme_file="${XDG_STATE_HOME:-$HOME/.local/state}/current-theme"
typeset _current_theme="catppuccin-mocha"
[[ -r "$_current_theme_file" ]] && _current_theme="$(<"$_current_theme_file")"

typeset _syntax_theme_file="${ZDOTDIR:-$HOME/.config/zsh}/syntax-themes/${_current_theme}.zsh"
if [[ -f "$_syntax_theme_file" ]]; then
    source "$_syntax_theme_file"
else
    echo "theme.zsh: unknown theme '$_current_theme', falling back to catppuccin-mocha" >&2
    source "${ZDOTDIR:-$HOME/.config/zsh}/syntax-themes/catppuccin-mocha.zsh"
fi
unset _current_theme_file _current_theme _syntax_theme_file

# ------------------------------------------------
# 3. FZF Color Theme & Previews
# ------------------------------------------------
if command -v fzf >/dev/null 2>&1; then
    export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
      --info=inline-right \
      --ansi \
      --layout=reverse \
      --border=rounded \
      --color=border:#928374 \
      --color=fg:#ebdbb2 \
      --color=gutter:#1d2021 \
      --color=header:#d65d0e \
      --color=hl+:#83a598 \
      --color=hl:#83a598 \
      --color=info:#665c54 \
      --color=marker:#fb4934 \
      --color=pointer:#fb4934 \
      --color=prompt:#83a598 \
      --color=query:#ebdbb2:regular \
      --color=scrollbar:#928374 \
      --color=separator:#d65d0e \
      --color=spinner:#fb4934 \
    "

    # Shell Integration (Ctrl+R, Ctrl+T, Alt+C)
    eval "$(fzf --zsh)"
fi

# ------------------------------------------------
# 4. Native Zsh Autocompletion Menu Styling
# ------------------------------------------------
# Enables the beautiful grid menu for tab completions
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
