#!/bin/bash
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install -y flathub com.mattjakeman.ExtensionManager

log "Gnome-Extensions-Manager successfully installed"