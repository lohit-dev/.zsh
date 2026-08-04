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
    # Shared with theme.zsh (shell) and Neovim's colorscheme.lua (editor) --
    # writing here is what keeps all three in sync, not sed-patching a
    # source line in theme.zsh anymore.
    local state_file="${XDG_STATE_HOME:-$HOME/.local/state}/current-theme"

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

    # Detect current theme from the shared state file
    local current=""
    [[ -r "$state_file" ]] && current="$(<"$state_file")"

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

        mkdir -p "${state_file:h}"
        echo "$selected" > "$state_file"

        # ── Theme → Ghostty + Wallpaper map ──────────────────────────
        local ghostty_theme="" wallpaper=""
        local wp_dir="$HOME/Pictures/wallpapers"
        case "$selected" in
            "dracula")
                ghostty_theme="Dracula"
                wallpaper="$wp_dir/base.png"
                ;;
            "catppuccin-mocha")
                ghostty_theme="Catppuccin Mocha"
                wallpaper="$wp_dir/catpuccin.png"
                ;;
            "catppuccin-macchiato")
                ghostty_theme="Catppuccin Macchiato"
                wallpaper="$wp_dir/catpuccin.png"
                ;;
            "gruvbox")
                ghostty_theme="Gruvbox Dark Hard"
                wallpaper="$wp_dir/astro.png"
                ;;
            "tokyo_night")
                ghostty_theme="Tokyo Night"
                wallpaper="$wp_dir/nord.png"
                ;;
            "nord")
                ghostty_theme="Nord"
                wallpaper="$wp_dir/nord.png"
                ;;
            "cyberpunk")
                ghostty_theme="Cyberpunk"
                wallpaper="$wp_dir/base.png"
                ;;
        esac

        # ── Update Ghostty config + reload ───────────────────────────
        local ghostty_conf="$HOME/.config/ghostty/config"
        if [[ -n "$ghostty_theme" && -f "$ghostty_conf" ]]; then
            printf "  \e[1;34m[*]\e[0m Ghostty theme → \e[1;32m%s\e[0m\n" "$ghostty_theme"
            sed -i '' "s|^theme =.*|theme = $ghostty_theme|" "$ghostty_conf"
            # Reload Ghostty without restarting (sends reload-config signal)
            pkill -USR2 ghostty 2>/dev/null || true
        elif [[ -n "$ghostty_theme" ]]; then
            printf "  \e[1;33m[!]\e[0m Ghostty config not found at %s, skipped\n" "$ghostty_conf"
        fi

        # ── Set macOS wallpaper via osascript ─────────────────────────
        # This used to fail silently when the file didn't exist -- if you've
        # been seeing "wallpaper doesn't change for some themes", it's very
        # likely one of these paths just doesn't match what's actually in
        # ~/Pictures/wallpapers. Now it tells you instead of doing nothing.
        if [[ -n "$wallpaper" && -f "$wallpaper" ]]; then
            printf "  \e[1;34m[*]\e[0m Wallpaper → \e[1;32m%s\e[0m\n" "${wallpaper:t}"
            osascript -e "
                tell application \"System Events\"
                    set theDesktops to a reference to every desktop
                    repeat with d in theDesktops
                        set picture of d to POSIX file \"$wallpaper\"
                    end repeat
                end tell
            " 2>/dev/null
        elif [[ -n "$wallpaper" ]]; then
            printf "  \e[1;31m[!]\e[0m Wallpaper file not found: \e[1;33m%s\e[0m (wallpaper not changed)\n" "$wallpaper"
        fi

        printf "  \e[1;34m[*]\e[0m Reloading shell...\n"
        sleep 0.5 && clear
        exec zsh
    else
        printf "\n\e[1;31m  [!] Invalid choice.\e[0m\n"
    fi
}
