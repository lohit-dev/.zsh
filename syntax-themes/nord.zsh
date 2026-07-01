# Nord Syntax Theme
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES

## Comments
ZSH_HIGHLIGHT_STYLES[comment]='fg=#4c566a'
## Functions / Commands
ZSH_HIGHLIGHT_STYLES[alias]='fg=#a3be8c'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#a3be8c'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#a3be8c'
ZSH_HIGHLIGHT_STYLES[function]='fg=#a3be8c'
ZSH_HIGHLIGHT_STYLES[command]='fg=#a3be8c'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#a3be8c,italic'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#ebcb8b,italic'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#ebcb8b'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#ebcb8b'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#b48ead'
## Built-ins
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#88c0d0'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#88c0d0'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#88c0d0'
## Punctuation
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#b48ead'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#d8dee9'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#d8dee9'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#d8dee9'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#b48ead'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#b48ead'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#b48ead'
## Strings
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=#ebcb8b'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=#ebcb8b'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#ebcb8b'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#bf616a'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#ebcb8b'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#bf616a'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#ebcb8b'
## Variables
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#d8dee9'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#bf616a'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#d8dee9'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#d8dee9'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#d8dee9'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#d8dee9'
## Misc
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#bf616a'
ZSH_HIGHLIGHT_STYLES[path]='fg=#d8dee9,underline'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#81a1c1,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#d8dee9,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#81a1c1,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#d8dee9'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#b48ead'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#bf616a'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#d8dee9'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#d8dee9'
ZSH_HIGHLIGHT_STYLES[default]='fg=#d8dee9'
ZSH_HIGHLIGHT_STYLES[cursor]='fg=#d8dee9'
