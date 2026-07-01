#!/usr/bin/env zsh
# ================================================================
# Shell Options & History Configuration
# ================================================================

# ------------------------------------------------
# Shell Behavior
# ------------------------------------------------
setopt autocd              # just type a directory name to cd into it
setopt correct             # suggest corrections for typos
setopt interactivecomments # allow # comments in interactive shell
setopt magicequalsubst     # expand filenames in foo=~/bar
setopt nonomatch           # don't error on failed glob, pass it through
setopt notify              # report background job status immediately
setopt numericglobsort     # sort globs numerically (file2 before file10)
setopt promptsubst         # allow variable expansion in prompts

# ------------------------------------------------
# History
# ------------------------------------------------
HISTSIZE=10000
HISTFILE="$ZDOTDIR/.zsh_history"
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory          # append to history, don't overwrite
setopt sharehistory           # share history across all sessions
setopt hist_ignore_space      # commands starting with space aren't recorded
setopt hist_ignore_all_dups   # remove older duplicate entries
setopt hist_save_no_dups      # don't write duplicates to file
setopt hist_ignore_dups       # don't record consecutive duplicates
setopt hist_find_no_dups      # skip duplicates when searching
