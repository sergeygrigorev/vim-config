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
    dotfiles.local
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

bash_dir=$(dirname "$0")
dotfiles_dir=$(realpath "$(dirname "$bash_dir")")

cat << EOF > "$bash_dir/dotfiles.local.bashrc"
DOTFILES_DIR='$dotfiles_dir'
EOF

"$dotfiles_dir/tools/merge_sections.sh" "$bash_dir" bashrc '#' "$target_file" "${sections[@]}"

echo
