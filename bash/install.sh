#!/usr/bin/env bash

machine_type="$1"
shell_type="$2"
target_file="$3"

if [[ -z "$machine_type" ]]; then
    echo "Missing machine type: [server, workstation]"
    exit 1
fi
if [[ -z "$shell_type" ]]; then
    echo "Missing shell type: [bash, wsl, mingw]"
    exit 2
fi
if [[ -z "$target_file" ]]; then
    echo "Missing target file"
    exit 3
fi

sections=(
    common
    "$machine_type"
    "$shell_type"
    prompt
    common.local
    "$machine_type.local"
    "$shell_type.local"
    prompt.local
    local
)

echo 'Installing bash configs...'
echo "  machine type: $machine_type"
echo "  shell type: $shell_type"

SCRIPT_DIR=$(dirname "$0")
"$SCRIPT_DIR/../tools/merge_sections.sh" "$SCRIPT_DIR" bashrc '#' "$target_file" "${sections[@]}"

echo
