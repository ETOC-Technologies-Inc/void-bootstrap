. config.base.sh

arch="x86_64"

musl=false

img_size="24G"

extra_void_repos=(
	nonfree multilib multilib-nonfree
)

base_pkgs+=(
	dejavu-fonts-ttf # for proper font rendering in ff :)
	noto-fonts-emoji # for emoji keyboard on gnome shell mobile
	Vulkan-Tools glxinfo # for vkcube and other GPU tools
	waydroid # for running Android apps
	flatpak
)
extra_build_pkgs+=(
	libphonenumber openimageio openvdb openimageio blender
	mutter gnome-shell # gnome shell mobile
	pmos-tweaks
	megapixels callaudiod feedbackd #gnome-calls purism-chatty
)
extra_install_pkgs+=(
	pmos-tweaks
	megapixels #gnome-calls purism-chatty

	psensor
	nvtop

	# other stuff
	sublime-text4
	telegram-desktop
	Signal-Desktop

	kicad
	kicad-footprints
	kicad-library
	kicad-packages3D
	kicad-symbols
	kicad-templates

	python3
	python3-pip
	cmake
	gcc
	arduino-cli

	blender
	krita
	gimp

	vlc
	file-roller
	evince
	eog

	# steam stuff
	libgcc-32bit libstdc++-32bit libdrm-32bit libglvnd-32bit
	steam
)
overlays=(
	# drop somainline overlay temporarily to apply it after EVERYTHING else
	${overlays[@]/somainline}

	ui-gnome
	pulseaudio
	qcom_spmi_haptics-feedbackd
	sdm845-mainline-alsa-ucm-conf

	somainline

	orchis-theme
	brave-flatpak
	discord-flatpak
	gnome-extensions-manager-flatpak

	megaTinyCore-arduino-cli
	prusa-slicer-github-latest
)
enable_sv=(
	# drop buffyboard sv to avoid potential input issues in GNOME (https://gitlab.com/cherrypicker/buffyboard/-/issues/21)
	"${enable_sv[@]/buffyboard}"

	waydroid-container
)
# disable_sv+=(

# )
img_name_format="${img_name_format/-base/-gnome}"
