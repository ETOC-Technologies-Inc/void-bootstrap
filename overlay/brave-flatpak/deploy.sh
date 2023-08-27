#!/bin/bash
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install -y flathub com.brave.Browser

cd /usr/share/applications
sudo ln -s /var/lib/flatpak/app/com.brave.Browser/current/active/export/share/applications/com.brave.Browser.desktop brave.desktop

log "Brave successfully installed"
log "setting Brave as the default browser..."

xdg-settings set default-web-browser brave.desktop
xdg-mime default brave.desktop x-scheme-handler/https
xdg-mime default brave.desktop x-scheme-handler/http