#!/bin/bash

xbps-install -y sassc gtk-engine-murrine gnome-themes-extra

installusrs=($USERNAMES)

runas ${installusrs[0]} <<EOF
git clone https://github.com/vinceliuice/Orchis-theme.git
./Orchis-theme/install.sh -t pink -c dark --tweaks black --shell 42 -l
gsettings set org.gnome.desktop.interface gtk-theme 'Orchis-Pink-Dark'
gsettings set org.gnome.shell enabled-extensions "['user-theme@gnome-shell-extensions.gcampax.github.com']"
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
gsettings set org.gnome.shell.extensions.user-theme name 'Orchis-Pink-Dark'
EOF

rm -rf ./Orchis-theme

log "Orchis-theme installed"