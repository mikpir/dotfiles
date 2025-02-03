#!/usr/bin/env bash

sudo dnf in -y \
  git nvim kitty gcc g++ openssl \
  grin slurp wl-clipboard fzf z \
  speedtest-cli hwinfo \
  tldr \
  flatpak \
  pandoc \
  python3 \
  chromedriver chromium \
  postgresql

# Vscode repo
# sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
# sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
# sudo dnf check-update

########### Flatpaks ##################

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install -y com.slack.Slack com.bitwarden.desktop com.discordapp.Discord com.spotify.Client

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.config/git-completion.bash

########### Docker ##################
sudo dnf -y install dnf-plugins-core
sudo dnf-3 config-manager \
  --add-repo \
  https://download.docker.com/linux/fedora/docker-ce.repo

sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

# Add current user to docker group
USER=$(whoami)
sudo usermod -aG docker $USER

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

########### Sway ##################
sudo dnf in -y sway swaylock mako wofi waybar playerctl

########### Apps ##################
curl -sS https://starship.rs/install.sh | sh -s -- -y
