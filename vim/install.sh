#!/usr/bin/env bash

flavor="$1"
target_file="$2"

if [[ -z "$flavor" ]]; then
    echo "Missing flavor: [vanilla, idea]"
    exit 1
fi
if [[ -z "$target_file" ]]; then
    echo "Missing target file"
    exit 2
fi

sections=(
    helpers
    helpers.local
    functions
    functions.local
    options/common
    options/common.local
    "options/$flavor"
    "options/$flavor.local"
    mapping/common
    mapping/common.local
    "mapping/$flavor"
    "mapping/$flavor.local"
    plugins/common
    plugins/common.local
    "plugins/$flavor"
    "plugins/$flavor.local"
)

echo 'Installing vim configs...'
echo "  flavor: $flavor"

SCRIPT_DIR=$(dirname "$0")
"$SCRIPT_DIR/../tools/merge_sections.sh" "$SCRIPT_DIR" vim '"' "$target_file" "${sections[@]}"

echo
