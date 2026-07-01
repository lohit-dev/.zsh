#!/usr/bin/env zsh
# ================================================================
# Vim Mode Configuration
# ================================================================
# Press ESC to enter normal mode (block cursor)
# Press i to enter insert mode (beam cursor)
# Press v in normal mode to open $EDITOR
#
# Cursor Styles:
#   Insert  → blinking beam  |
#   Normal  → blinking block █
#   Visual  → blinking underline _
# ================================================================

# Vi mode cursor styles (set BEFORE the plugin loads)
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BEAM
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_BLINKING_UNDERLINE

# History search bindings that work in vi mode
# Up/Down arrows search history based on what you've typed
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
