#!/usr/bin/env zsh
# ================================================================
# Zsh Plugins (Zinit)
# ================================================================

# Zinit setup
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "$ZINIT_HOME/zinit.zsh"

# ------------------------------------------------
# Plugins
# ------------------------------------------------

# Core experience
zinit light zsh-users/zsh-completions

# Load completions optimally (once every 24 hours instead of on every boot)
autoload -Uz compinit
setopt EXTENDED_GLOB
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
    compinit
    touch "${ZDOTDIR}/.zcompdump"
else
    compinit -C
fi
unsetopt EXTENDED_GLOB

# These plugins MUST be loaded after compinit
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search
zinit light hlissner/zsh-autopair
zinit light jeffreytse/zsh-vi-mode         # Vim mode (ESC = normal, i = insert)

# Utilities
zinit light zdharma-continuum/history-search-multi-word
zinit light djui/alias-tips
zinit light b4b4r07/enhancd
zinit light tarrasch/zsh-autoenv

# OMZ snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

zinit cdreplay -q
