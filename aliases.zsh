#!/usr/bin/env zsh
# ================================================================
# Aliases Configuration
# ================================================================
# All shell aliases in one place for easy management
# Edit this file to add/modify/remove aliases
#
# Quick Tips:
# - VIM MODE: Press ESC for vim keybindings (see VIM-MODE.md)
# - History: Ctrl+R for fuzzy search, or use arrow keys
# - Auto-complete: Start typing and press TAB

# ------------------------------------------------
# General Shortcuts
# ------------------------------------------------
alias c='clear'                                                        # clear terminal
alias vc='code'                                                        # gui code editor

# ------------------------------------------------
# Directory Navigation
# ------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Zoxide (smarter cd - remembers frequently used directories)
# cd is aliased to 'z' in user.zsh
# Use: z <partial-name> to jump to directory

# ------------------------------------------------
# File Listings (eza)
# ------------------------------------------------
# Basic listing
alias ls='eza --grid --icons=auto'                                     # short list (horizontal grid)
alias l='eza -lh --icons=auto'                                         # long list
alias la='eza -lha --icons=auto'                                       # long list all (including hidden)
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all sorted
alias ld='eza -lhD --icons=auto'                                       # long list dirs only
alias lt='eza --icons=auto --tree'                                     # list as tree

# ------------------------------------------------
# File Operations
# ------------------------------------------------
alias mkdir='mkdir -p'                                                 # always create parent dirs
alias q='exit'                                                         # exit shell

# ------------------------------------------------
# Fuzzy Finder Aliases (fzf functions)
# ------------------------------------------------
# These functions are defined in functions/fzf.zsh
alias ffec='_fuzzy_edit_search_file_content'                           # fuzzy search file content
alias ffcd='_fuzzy_change_directory'                                   # fuzzy change directory
alias ffe='_fuzzy_edit_search_file'                                    # fuzzy edit file
alias ffch='_fuzzy_search_cmd_history'                                 # fuzzy command history

# ------------------------------------------------
# Neovim Shortcuts
# ------------------------------------------------
if command -v nvim >/dev/null 2>&1; then
    alias vi='nvim'
    alias vim='nvim'
    alias svi='sudo nvim'
    alias nv='nvim'
    alias nvd='nvim .'                                                     # open nvim in current dir
fi
alias lvim='NVIM_APPNAME=lvim nvim'
alias chad='NVIM_APPNAME=nvim nvim'
alias kvim='NVIM_APPNAME=kvim nvim'

# ------------------------------------------------
# Git Shortcuts
# ------------------------------------------------
alias clone='git clone'
alias cloned='git clone --depth=1'
alias commit='git commit -m'
alias push='git push'
alias pull='git pull'
alias gst='git status'

# ------------------------------------------------
# Grep (always colorize)
# ------------------------------------------------
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ------------------------------------------------
# Utilities
# ------------------------------------------------
alias exe='chmod +x'                                                       # make file executable
alias src='source $ZDOTDIR/.zshrc'                                         # reload zsh config

# ------------------------------------------------
# Network
# ------------------------------------------------
alias iplocal="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
if command -v curl >/dev/null 2>&1; then
    alias ipexternal="curl -s ifconfig.me && echo"
fi

# ------------------------------------------------
# FZF Preview
# ------------------------------------------------
if command -v fzf >/dev/null 2>&1 && command -v bat >/dev/null 2>&1; then
    alias preview='fzf --preview "bat --style=numbers --color=always --line-range :500 {}"'
fi

# ------------------------------------------------
# Bat (better cat)
# ------------------------------------------------
if command -v bat >/dev/null 2>&1; then
    alias cat='bat --style=plain --paging=never --color=auto'
fi

# ------------------------------------------------
# Lazygit
# ------------------------------------------------
if command -v lazygit >/dev/null 2>&1; then
    alias lg='lazygit'
fi

# ------------------------------------------------
# Zoxide (smarter cd)
# ------------------------------------------------
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init zsh)"
    alias cd="z"
fi

# ------------------------------------------------
# thefuck (command correction) - HARDCODED FOR SPEED
# ------------------------------------------------
if command -v thefuck &>/dev/null; then
    alias fuck='eval "$(TF_ALIAS=fuck PYTHONIOENCODING=utf-8 thefuck "$(fc -ln -1)")"'
    alias hell='eval "$(TF_ALIAS=hell PYTHONIOENCODING=utf-8 thefuck "$(fc -ln -1)")"'
    alias damn='eval "$(TF_ALIAS=damn PYTHONIOENCODING=utf-8 thefuck "$(fc -ln -1)")"'
fi

