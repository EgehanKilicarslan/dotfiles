#!/usr/bin/env bash

base_dir=$(pwd)
yaml_file="$base_dir/instruction.yaml"

# Check if 'yq' is installed
cleanup_yq=0
if ! command -v yq &> /dev/null; then
    echo "⬇️ Installing 'yq' from the official repository..."
    sudo pacman -Sy --needed --noconfirm yq
    if [[ $? -ne 0 ]]; then
        echo "❌ Failed to install 'yq'!"
        exit 1
    fi
    cleanup_yq=1
fi

if [[ ! -f $yaml_file ]]; then
    echo "❌ YAML file not found: $yaml_file"
    if [[ $cleanup_yq -eq 1 ]]; then
        sudo pacman -Rns --noconfirm yq
    fi
    exit 1
fi

# Check for package manager
use_paru=0
if command -v paru &> /dev/null; then
    use_paru=1
    echo "✅ 'paru' found."
elif command -v pacman &> /dev/null; then
    echo "⚠️ 'paru' not found, only 'pacman' is available."
else
    echo "❌ Neither 'paru' nor 'pacman' is installed."
    if [[ $cleanup_yq -eq 1 ]]; then
        sudo pacman -Rns --noconfirm yq
    fi
    exit 1
fi

# Linking dotfiles
echo "🔗 Setting up dotfile links..."
link_count=$(yq '.link | length' "$yaml_file")
for (( idx=0; idx<link_count; idx++ )); do
    source=$(yq ".link[$idx].source" "$yaml_file")
    target=$(yq ".link[$idx].target" "$yaml_file")
    abs_source="$base_dir/$source"

    if [[ ! -e $abs_source ]]; then
        echo "⚠️ Source not found: $abs_source"
        continue
    fi

    if [[ -e $target && ! -L $target ]]; then
        mv "$target" "$target.backup.$(date +%s)"
        echo "📦 Backed up: $target"
    fi

    if [[ -L $target ]]; then
        rm "$target"
    fi

    mkdir -p "$(dirname "$target")"
    ln -s "$abs_source" "$target"
    echo "✅ Linked: $source → $target"
done

# Install pacman packages
pacman_count=$(yq '.packages.pacman | length' "$yaml_file" 2>/dev/null || echo "")
if [[ -n $pacman_count ]]; then
    echo "📦 Installing pacman packages..."
    for pkg in $(yq '.packages.pacman[]' "$yaml_file"); do
        echo "➡️ $pkg"
        if [[ $use_paru -eq 1 ]]; then
            paru -S --noconfirm --skipreview "$pkg"
        else
            sudo pacman -S --noconfirm "$pkg"
        fi
    done
fi

# Install AUR packages
if [[ $use_paru -eq 1 ]]; then
    aur_count=$(yq '.packages.aur | length' "$yaml_file" 2>/dev/null || echo "")
    if [[ -n $aur_count ]]; then
        echo "📦 Installing AUR packages..."
        for pkg in $(yq '.packages.aur[]' "$yaml_file"); do
            echo "➡️ $pkg"
            paru -S --noconfirm --skipreview "$pkg"
        done
    fi
else
    aur_count=$(yq '.packages.aur | length' "$yaml_file" 2>/dev/null || echo "")
    if [[ -n $aur_count ]]; then
        echo "⚠️ Skipping AUR packages, 'paru' is not installed."
    fi
fi

# Cleanup
if [[ $cleanup_yq -eq 1 ]]; then
    echo "🧹 Removing temporarily installed 'yq'..."
    sudo pacman -Rns --noconfirm yq
fi

echo "🎉 Setup completed."
