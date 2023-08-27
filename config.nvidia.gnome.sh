. config.gnome.sh


extra_install_pkgs+=(
	# needed missing packages for nvidia proprietary drivers to work with steam
	nvidia-libs-32bit
	nvidia-gtklibs-32bit
	nvidia
)


overlays+=(
	# disable Wayland for gdm to avoid failure on boot
	nvidia-gdm
)