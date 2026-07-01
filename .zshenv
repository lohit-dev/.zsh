#!/usr/bin/env zsh
# ================================================================
# ~/.config/zsh/.zshenv
# ================================================================
# Environment variables, PATHs, and terminal capabilities.

# ── Terminal Settings ────────────────────────────────────────────
if [[ "$TERM" == "xterm-ghostty" ]]; then
    export TERM="xterm-256color"
fi
if [[ -z "$COLORTERM" ]]; then
    export COLORTERM=truecolor
fi

export LESS="-R -F -X"
export PAGER="less"
export MANPAGER="less"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# ── Editor ───────────────────────────────────────────────────────
export EDITOR="nvim"
export VISUAL="nvim"
export SUDO_EDITOR="nvim"
export FCEDIT="nvim"

# ── Runtime Environments ─────────────────────────────────────────

# PostgreSQL (auto-detect version)
if [[ -d "/opt/homebrew/opt/postgresql@18" ]]; then
    export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"
    export LDFLAGS="-L/opt/homebrew/opt/postgresql@18/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/postgresql@18/include"
elif [[ -d "/opt/homebrew/opt/postgresql@17" ]]; then
    export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
    export LDFLAGS="-L/opt/homebrew/opt/postgresql@17/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/postgresql@17/include"
fi

# NVM (Node Version Manager) - LAZY LOADED FOR SPEED
export NVM_DIR="$HOME/.nvm"
nvm() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm use --silent default >/dev/null 2>&1
    nvm "$@"
}
node() { unset -f nvm node npm npx; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; node "$@"; }
npm()  { unset -f nvm node npm npx; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; npm "$@"; }
npx()  { unset -f nvm node npm npx; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; npx "$@"; }

# uv / Rust env
if [[ -f "$HOME/.local/share/../bin/env" ]]; then
    . "$HOME/.local/share/../bin/env"
fi
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# Starship default if not set
export STARSHIP_CONFIG="${STARSHIP_CONFIG:-$ZDOTDIR/starship/starship-pure-preset.toml}"
