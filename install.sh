#!/usr/bin/env bash

mkdir -p "$HOME/.local/bin"

curl -sLO https://raw.githubusercontent.com/moises-h7/lscat/main/lscat

chmod +x lscat
mv lscat "$HOME/.local/bin/"

for RC in "$HOME/.bashrc" "$HOME/.zshrc"; do
    if [ -f "$RC" ]; then
        if ! grep -q ".local/bin" "$RC"; then
            echo -e '\nexport PATH="$HOME/.local/bin:$PATH"' >> "$RC"
        fi
    fi
done

echo "Instalação concluída! Reinicie o terminal ou use: source ~/.bashrc"
