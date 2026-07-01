# ================================================================
# ~/.config/zsh/.zshrc
# ================================================================
# Main entry point for Zsh configuration

# 1. Environment Variables & PATHs
source "$ZDOTDIR/.zshenv"

# 2. Shell Options & History Config
source "$ZDOTDIR/options.zsh"

# 3. Keybindings (Vim mode)
source "$ZDOTDIR/keybinds.zsh"

# 4. Plugins (Zinit)
source "$ZDOTDIR/plugins.zsh"

# 5. Functions
source "$ZDOTDIR/functions/fzf.zsh"
source "$ZDOTDIR/functions/git.zsh"
source "$ZDOTDIR/functions/style.zsh"
source "$ZDOTDIR/functions/kb_help.zsh"

# 6. Aliases (Standard, Git, TheFuck, Zoxide)
# Loaded after plugins so plugins don't overwrite your custom aliases
source "$ZDOTDIR/aliases.zsh"

# 7. Theme (Starship, FZF colors, Syntax Highlighting)
source "$ZDOTDIR/theme.zsh"
export STARSHIP_CONFIG="/Users/kinggrey/.config/zsh/starship/starship-jetpack.toml"
