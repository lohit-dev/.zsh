#!/usr/bin/env zsh
# ================================================================
# Git Functions
# ================================================================

# ── gpush (interactive git add → commit → push) ─────────────────
function gpush() {
    # Check if we're in a git repo
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        printf "\e[1;31m  ✗  Not inside a Git repository.\e[0m\n"
        return 1
    fi

    local branch_name=$(git branch --show-current 2>/dev/null)
    local untracked=$(git status --porcelain | grep -c '^??')
    local unstaged=$(git diff --name-only | wc -l | tr -d ' ')
    local staged=$(git diff --cached --name-only | wc -l | tr -d ' ')

    if [[ "$untracked" -eq 0 && "$unstaged" -eq 0 && "$staged" -eq 0 ]]; then
        printf "\e[1;32m  ✓  Nothing to push.\e[0m\n"
        return 0
    fi

    # Show status summary
    [[ "$untracked" -gt 0 ]] && printf "  \e[1;33m⚡\e[0m %s untracked files\n" "$untracked"
    [[ "$unstaged" -gt 0 ]]  && printf "  \e[1;33m⚡\e[0m %s modified files\n" "$unstaged"
    [[ "$staged" -gt 0 ]]    && printf "  \e[1;33m⚡\e[0m %s staged changes\n" "$staged"
    printf "  \e[1;36m⎇\e[0m  branch: \e[1;32m%s\e[0m\n\n" "$branch_name"

    printf "\e[1;35m❯\e[0m Commit message: "
    read -r msg

    if [[ -z "$msg" ]]; then
        printf "\e[1;31m  ✗  Empty commit message. Aborting.\e[0m\n"
        return 1
    fi

    printf "\n  \e[1;34m[*]\e[0m Pushing to \e[1;32m%s\e[0m...\n" "$branch_name"
    git add . && git commit -m "$msg" && git push origin "$branch_name"

    if [[ $? -eq 0 ]]; then
        printf "\n  \e[1;32m✓  Pushed successfully!\e[0m\n"
    else
        printf "\n  \e[1;31m✗  Push failed. Check errors above.\e[0m\n"
    fi
}
