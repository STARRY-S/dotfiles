#!/bin/bash

set -euo pipefail
cd $(dirname $0)

REPO_DIR="$(pwd)"

# Safely create symlinks with backup
link_config() {
    local src="${REPO_DIR}/$1"
    local dest="$2"
    local dest_dir="$(dirname "${dest}")"

    mkdir -p "${dest_dir}"

    if [ ! -e "${src}" ]; then
        echo "Warning: Source ${src} not found in repo, skipping..." >&2
        return
    fi

    if [ -L "${dest}" ] && [ "$(readlink "${dest}")" = "${src}" ]; then
        echo "Already linked: ${dest}"
        return
    fi

    if [ -e "${dest}" ] || [ -L "${dest}" ]; then
        local backup_name="${dest}_backup_$(date +%Y%m%d_%H%M%S)"
        echo "Backing up existing ${dest} to ${backup_name}"
        mv "${dest}" "${backup_name}"
    fi

    # Create the symbolic link
    echo "Linking ${1} -> ${dest}"
    ln -sfn "${src}" "${dest}"
}

echo "Starting dotfiles installation..."

link_config "fontconfig" "${HOME}/.config/fontconfig"

link_config "gitconfig/.gitconfig" "${HOME}/.gitconfig"
link_config "gitconfig/.gitconfig-work" "${HOME}/.gitconfig-work"

if [ ! -e "nvim/config/custom.lua" ]; then
    cp "nvim/lua/config/custom.example.lua" "nvim/lua/config/custom.lua"
fi
link_config "nvim" "${HOME}/.config/nvim"

link_config "ssh" "${HOME}/.ssh/config"

link_config "starship/starship.toml" "${HOME}/.config/starship.toml"

if [ ! -e "zsh/.zcustom.zsh" ]; then
    cp "zsh/.zshrc.local.example" "zsh/.zshrc.local"
fi
link_config "zsh/.zshrc" "${HOME}/.zshrc"
link_config "zsh/.zshrc.local" "${HOME}/.zshrc.local"

# Fix strict permissions required by SSH daemon
if [ -f "${HOME}/.ssh/config" ]; then
    chmod 600 "${HOME}/.ssh/config"
fi

echo "Installation complete!"
