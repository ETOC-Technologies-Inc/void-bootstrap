#!/bin/bash
if [ -e /etc/gdm/custom.conf ]; then
	log 'Disabling Wayland for nvidia to not kill gdm on boot...'
	sed '/^\[daemon\]$/a WaylandEnable=false' -i /etc/gdm/custom.conf
fi