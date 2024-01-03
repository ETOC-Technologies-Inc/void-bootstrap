. config.base.sh

arch="x86_64"

musl=false

img_size="3G"

mirror="https://repo-fi.voidlinux.org/"

img_name_format="nafoarmories-%a-base-rootfs-$(date +'%Y-%m-%d--%H-%M').img"

mirror="https://repo-default.voidlinux.org/"

extra_void_repos=(
	nonfree multilib multilib-nonfree
)

base_pkgs+=(
	# dejavu-fonts-ttf # for proper font rendering in ff :)
	# noto-fonts-emoji # for emoji keyboard on gnome shell mobile
	# Vulkan-Tools glxinfo # for vkcube and other GPU tools
	# waydroid # for running Android apps
	# flatpak
	mariadb mariadb-client python3 python3-mysqlclient
	nodejs nodejs-devel pnpm
	nodejs-lts nodejs-lts-devel
)
# extra_build_pkgs+=(
# 	# libphonenumber openimageio openvdb openimageio blender
# 	# mutter gnome-shell # gnome shell mobile
# 	# pmos-tweaks
# 	# megapixels callaudiod feedbackd #gnome-calls purism-chatty
# )
enable_sv+=(
	mysqld
)
