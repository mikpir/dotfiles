#!/usr/bin/env bash

  # git nvim kitty gcc g++ openssl \
  # grin slurp wl-clipboard fzf z \
  # speedtest-cli hwinfo \
  # tldr \
  # flatpak \
  # pandoc \
  # python3 \
  # chromedriver chromium \
  # postgresql

########### Flatpaks ##################

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install -y com.slack.Slack com.bitwarden.desktop com.spotify.Client com.onepassword.OnePassword

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.config/git-completion.bash

git clone https://github.com/asdf-vm/asdf.git ~/.asdf

. /etc/os-release
curl -fsSL "https://copr.fedorainfracloud.org/coprs/scottames/ghostty/repo/fedora-${VERSION_ID}/scottames-ghostty-fedora-${VERSION_ID}.repo" | sudo tee /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:scottames:ghostty.repo > /dev/null
rpm-ostree refresh-md

rpm-ostree install ghostty fd-find fzf niri ripgrep

########### Apps ##################
curl -sS https://starship.rs/install.sh | sh -s -- -y
