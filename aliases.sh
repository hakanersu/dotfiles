#!/bin/bash

# Initialize zoxide for Bash
eval "$(zoxide init bash)"

# Source individual alias files
for file in ~/.dotfiles/aliases/*.sh; do
    if [ -f "$file" ]; then
        . "$file"
    fi
done
