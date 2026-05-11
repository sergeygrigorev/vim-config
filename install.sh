#!/usr/bin/env bash

if [[ ! -z "$WSL_DISTRO_NAME" ]]; then
    shell_type=wsl
elif [[ ! -z "$MINGW_PREFIX" ]]; then
    shell_type=mingw
else
    shell_type=bash
fi

SCRIPT_DIR=$(dirname "$0")

"$SCRIPT_DIR/bash/install.sh" workstation "$shell_type" ~/user.bashrc
if [[ -d ~/server-config ]]; then
    "$SCRIPT_DIR/bash/install.sh" server bash ~/server-config/.bashrc
fi

"$SCRIPT_DIR/vim/install.sh" vanilla ~/.vimrc
if [[ "$shell_type" == 'mingw' ]]; then
    "$SCRIPT_DIR/vim/install.sh" idea ~/.ideavimrc
fi
if [[ -d ~/server-config ]]; then
    "$SCRIPT_DIR/vim/install.sh" vanilla ~/server-config/.vimrc
fi
