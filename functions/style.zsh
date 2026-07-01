#!/usr/bin/env zsh
# ================================================================
# Interactive Prompt & Syntax Theme Switcher
# ================================================================
# Usage:
#   style           — change Starship prompt theme
#   syntax-theme    — change syntax highlighting theme
# ================================================================

# ── Starship Prompt Switcher ─────────────────────────────────────
function style() {
    local starship_dir="$ZDOTDIR/starship"
    local zshrc="$ZDOTDIR/.zshrc"

    if [[ ! -d "$starship_dir" ]]; then
        printf "\e[1;31m  [!] Starship themes directory not found: %s\e[0m\n" "$starship_dir"
        return 1
    fi

    local -a styles=()
    local file
    for file in "$starship_dir"/*.toml(N); do
        styles+=("${${file:t}%.toml}")  # strip path and .toml extension
    done

    if (( ${#styles[@]} == 0 )); then
        printf "\e[1;31m  [!] No .toml themes found in %s\e[0m\n" "$starship_dir"
        return 1
    fi

    # Pretty box header
    printf "\n\e[1;36m╭────────────────────────────────────────╮\e[0m\n"
    printf "\e[1;36m│ \e[1;37m     ⭐ Choose a Starship Style       \e[1;36m│\e[0m\n"
    printf "\e[1;36m├────────────────────────────────────────┤\e[0m\n"

    local i
    for (( i=1; i<=${#styles[@]}; i++ )); do
        printf "\e[1;36m│\e[0m \e[1;33m%2d.\e[0m \e[1;32m%-34s\e[0m \e[1;36m│\e[0m\n" "$i" "${styles[$i]}"
    done

    printf "\e[1;36m╰────────────────────────────────────────╯\e[0m\n\n"
    printf "\e[1;35m❯\e[0m \e[1;37mChoose a number (1-%d):\e[0m " "${#styles[@]}"
    read -r stl

    if [[ "$stl" =~ ^[0-9]+$ ]] && (( stl > 0 && stl <= ${#styles[@]} )); then
        local selected="${styles[$stl]}"
        local prompt_file="$starship_dir/${selected}.toml"

        printf "\n  \e[1;34m[*]\e[0m Setting prompt to: \e[1;32m%s\e[0m\n" "$selected"

        # Update STARSHIP_CONFIG in .zshrc
        if grep -q '^export STARSHIP_CONFIG=' "$zshrc" 2>/dev/null; then
            sed -i '' "s|^export STARSHIP_CONFIG=.*|export STARSHIP_CONFIG=\"$prompt_file\"|g" "$zshrc"
        else
            # Append if not found
            echo "export STARSHIP_CONFIG=\"$prompt_file\"" >> "$zshrc"
        fi

        printf "  \e[1;34m[*]\e[0m Reloading shell...\n"
        sleep 0.5 && clear
        exec zsh
    else
        printf "\n\e[1;31m  [!] Invalid choice.\e[0m\n"
    fi
}

# ── Syntax Highlighting Theme Switcher ───────────────────────────
function syntax-theme() {
    local themes_dir="$ZDOTDIR/syntax-themes"
    local loader="$ZDOTDIR/theme.zsh"

    if [[ ! -d "$themes_dir" ]]; then
        printf "\e[1;31m  [!] Syntax themes directory not found: %s\e[0m\n" "$themes_dir"
        return 1
    fi

    local -a themes=()
    local file
    for file in "$themes_dir"/*.zsh(N); do
        themes+=("${${file:t}%.zsh}")
    done

    if (( ${#themes[@]} == 0 )); then
        printf "\e[1;31m  [!] No themes found in %s\e[0m\n" "$themes_dir"
        return 1
    fi

    # Detect current theme
    local current=""
    if [[ -f "$loader" ]]; then
        current=$(grep 'source.*syntax-themes/' "$loader" | sed 's|.*/||; s|\.zsh.*||')
    fi

    printf "\n\e[1;36m╭────────────────────────────────────────╮\e[0m\n"
    printf "\e[1;36m│ \e[1;37m   🎨 Choose a Syntax Theme           \e[1;36m│\e[0m\n"
    printf "\e[1;36m├────────────────────────────────────────┤\e[0m\n"

    local i
    for (( i=1; i<=${#themes[@]}; i++ )); do
        local marker="  "
        if [[ "${themes[$i]}" == "$current" ]]; then
            marker="▸ "
        fi
        printf "\e[1;36m│\e[0m \e[1;33m%2d.\e[0m %s\e[1;32m%-32s\e[0m \e[1;36m│\e[0m\n" "$i" "$marker" "${themes[$i]}"
    done

    printf "\e[1;36m╰────────────────────────────────────────╯\e[0m\n\n"
    printf "\e[1;35m❯\e[0m \e[1;37mChoose a number (1-%d):\e[0m " "${#themes[@]}"
    read -r choice

    if [[ "$choice" =~ ^[0-9]+$ ]] && (( choice > 0 && choice <= ${#themes[@]} )); then
        local selected="${themes[$choice]}"

        printf "\n  \e[1;34m[*]\e[0m Setting syntax theme to: \e[1;32m%s\e[0m\n" "$selected"

        # Update the source line in theme.zsh
        sed -i '' "s|^source.*syntax-themes/.*|source \"\$ZDOTDIR/syntax-themes/${selected}.zsh\"|" "$loader"

        # Update Ghostty terminal theme if available
        local ghostty_conf="$HOME/.config/ghostty/config"
        if [[ -f "$ghostty_conf" ]]; then
            local ghostty_theme=""
            case "$selected" in
                "gruvbox")              ghostty_theme="Gruvbox Dark Hard" ;;
                "dracula")              ghostty_theme="Dracula" ;;
                "catppuccin-mocha")     ghostty_theme="Catppuccin Mocha" ;;
                "catppuccin-macchiato") ghostty_theme="Catppuccin Macchiato" ;;
                "tokyo_night")          ghostty_theme="Tokyo Night" ;;
                "nord")                 ghostty_theme="Nord" ;;
                "cyberpunk")            ghostty_theme="Cyberpunk" ;;
            esac
            
            if [[ -n "$ghostty_theme" ]]; then
                printf "  \e[1;34m[*]\e[0m Setting Ghostty terminal theme to: \e[1;32m%s\e[0m\n" "$ghostty_theme"
                sed -i '' "s|^theme =.*|theme = $ghostty_theme|" "$ghostty_conf"
            fi
        fi

        printf "  \e[1;34m[*]\e[0m Reloading shell...\n"
        sleep 0.5 && clear
        exec zsh
    else
        printf "\n\e[1;31m  [!] Invalid choice.\e[0m\n"
    fi
}
