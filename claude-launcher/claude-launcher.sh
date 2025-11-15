#!/bin/bash

# Claude Code Profile Launcher
# Allows you to select a system prompt from ~/.claude/system-prompts before launching Claude Code

PROMPTS_DIR="$HOME/.claude/system-prompts"

# Check if system-prompts directory exists
if [ ! -d "$PROMPTS_DIR" ]; then
    echo "Error: $PROMPTS_DIR directory not found"
    exit 1
fi

# Get list of system prompts (basenames without extensions, supporting .txt and .md)
profiles=()
profile_files=()
while IFS= read -r file; do
    # Remove both .txt and .md extensions
    basename_file=$(basename "$file")
    profiles+=("${basename_file%.*}")
    profile_files+=("$file")
done < <(find "$PROMPTS_DIR" \( -name "*.txt" -o -name "*.md" \) -type f | sort)

# Check if any profiles exist
if [ ${#profiles[@]} -eq 0 ]; then
    echo "Error: No system prompts found in $PROMPTS_DIR"
    exit 1
fi

# Display interactive menu using select
echo "Select a Claude Code system prompt:"
PS3=$'\nEnter number: '
select profile_name in "${profiles[@]}" "Cancel"; do
    if [ "$profile_name" = "Cancel" ]; then
        echo "Cancelled"
        exit 0
    elif [ -n "$profile_name" ]; then
        # Find the corresponding file
        for i in "${!profiles[@]}"; do
            if [ "${profiles[$i]}" = "$profile_name" ]; then
                selected_file="${profile_files[$i]}"
                break
            fi
        done

        echo ""
        echo "Selected: $profile_name"
        echo "Launching Claude Code with $profile_name system prompt..."
        echo ""

        # Launch Claude Code with the system prompt from the selected file
        # Forward any additional arguments passed to this script
        exec claude --system-prompt "$(cat "$selected_file")" "$@"
    else
        echo "Invalid selection. Please try again."
    fi
done
