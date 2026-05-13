#!/usr/bin/env bash

workdir="$1"
extension="$2"
comment_prefix="$3"
target_file="$4"
shift 4
sections=("$@")

echo "  target: $target_file"
echo "  sections: [${sections[*]}]"

> "$target_file"
for section in "${sections[@]}"; do
    section_file="$workdir/$section.$extension"
    if [[ -f "$section_file" ]]; then
        echo -e "$comment_prefix [$section]\n" >> "$target_file"
        cat "$section_file" >> "$target_file"
        echo >> "$target_file"
#    else
#        echo "Section file '$section_file' for section '$section' does not exist." >&2
    fi
done
