#!/usr/bin/bash

# Install packages
apt update
apt install -y sudo build-essential git fzf direnv emacs-nox btop neofetch aspell ripgrep shellcheck dirmngr apt-transport-https ca-certificates curl gnupg

# Install docker
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/debian bookworm stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo usermod -aG sudo steve
sudo usermod -aG docker steve

mkdir -p /etc/docker
cat > /etc/docker/daemon.json <<EOF
{
  "features": {
    "buildkit": true
  }
}
EOF


# install asdf
# install tailscale if wanted
