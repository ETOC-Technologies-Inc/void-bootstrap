#!/bin/bash

xbps-install -y sassc gtk-engine-murrine gnome-themes-extra

installusrs=($USERNAMES)

runas ${installusrs[0]} <<EOF
git clone https://github.com/vinceliuice/Orchis-theme.git
./Orchis-theme/install.sh -t pink -c dark --tweaks black --shell 42 -l
EOF

rm -rf ./Orchis-theme

log "Orchis-theme installed"