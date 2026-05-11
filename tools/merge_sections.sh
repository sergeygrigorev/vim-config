#!/usr/bin/env bash

workdir="$1"
extension="$2"
comment_prefix="$3"
shift 3
sections=("$@")

for section in "${sections[@]}"; do
    section_file="$workdir/$section.$extension"
    if [[ -f "$section_file" ]]; then
        echo -e "$comment_prefix [$section]\n"
        cat "$section_file"
        echo
    else
        echo "Section file '$section_file' for section '$section' does not exist." >&2
    fi
done
