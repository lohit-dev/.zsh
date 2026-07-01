# Cyberpunk Syntax Theme
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES

## Comments
ZSH_HIGHLIGHT_STYLES[comment]='fg=#800080'
## Functions / Commands
ZSH_HIGHLIGHT_STYLES[alias]='fg=#00ff00'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#00ff00'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#00ff00'
ZSH_HIGHLIGHT_STYLES[function]='fg=#00ff00'
ZSH_HIGHLIGHT_STYLES[command]='fg=#00ff00'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#00ff00,italic'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#ffff00,italic'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#ffff00'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#ffff00'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#ff00ff'
## Built-ins
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#00ffff'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#00ffff'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#00ffff'
## Punctuation
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#ff007f'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#00ffff'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#00ffff'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#00ffff'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#ff007f'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#ff007f'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#ff007f'
## Strings
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=#ffff00'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=#ffff00'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#ffff00'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#ff0000'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#ffff00'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#ff0000'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#ffff00'
## Variables
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#ffffff'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#ff0000'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#ffffff'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#ffffff'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#ffffff'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#ffffff'
## Misc
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ff0000'
ZSH_HIGHLIGHT_STYLES[path]='fg=#00ffff,underline'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#ff00ff,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#00ffff,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#ff00ff,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#00ffff'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#ff00ff'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#ff0000'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#ffffff'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#ffffff'
ZSH_HIGHLIGHT_STYLES[default]='fg=#ffffff'
ZSH_HIGHLIGHT_STYLES[cursor]='fg=#ffffff'
