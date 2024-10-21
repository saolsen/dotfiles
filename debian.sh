#!/usr/bin/bash

# Before running, make sure sudo is installed and set up.
# Run the script as steve.
# Run from the dotfiles directory.

# Install packages
sudo apt update
sudo apt install -y sudo build-essential git mg fzf direnv emacs-nox btop neofetch aspell ripgrep shellcheck dirmngr apt-transport-https ca-certificates curl gnupg

# Install docker
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/debian bookworm stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo usermod -aG docker steve

sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json > /dev/null <<'EOF'
{
  "features": {
    "buildkit": true
  }
}
EOF

# User setup stuff.

git config --global user.name "steve olsen"
git config --global user.email "steve@steve.computer"

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1

./install.sh
