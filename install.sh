#!/bin/bash
set -e

echo "🔋 Installing battery warning service..."

# Make sure ~/.local/bin exists
mkdir -p "$HOME/.local/bin"
chmod 755 "$HOME/.local/bin"

# Copy script
cp battery-warning.sh "$HOME/.local/bin/battery-warning.sh"
chmod +x "$HOME/.local/bin/battery-warning.sh"

# Make sure systemd user dir exists
mkdir -p "$HOME/.config/systemd/user"

# Copy service and timer
cp battery-warning.service "$HOME/.config/systemd/user/"
cp battery-warning.timer "$HOME/.config/systemd/user/"

# Reload systemd
systemctl --user daemon-reload

# Enable + start the timer
systemctl --user enable --now battery-warning.timer

echo "✅ Battery warning service installed and running!"#!/bin/bash
set -e

echo "🔋 Installing battery warning service..."

# Make sure ~/.local/bin exists
mkdir -p "$HOME/.local/bin"
chmod 755 "$HOME/.local/bin"

# Copy script
cp $HOME/bar/battery-warning.sh "$HOME/.local/bin/battery-warning.sh"
chmod +x "$HOME/.local/bin/battery-warning.sh"

# Make sure systemd user dir exists
mkdir -p "$HOME/.config/systemd/user"

# Copy service and timer
cp $HOME/bar/battery-warning.service "$HOME/.config/systemd/user/"
cp $HOME/bar/battery-warning.timer "$HOME/.config/systemd/user/"

# Copy sound

mkdir -p "$HOME/Music/sound"
cp "$HOME/bar/sound/*" "$HOME/Music/sound/"

# Reload systemd
systemctl --user daemon-reload

# Enable + start the timer
systemctl --user enable --now battery-warning.timer

echo "✅ Battery warning service installed and running!"
