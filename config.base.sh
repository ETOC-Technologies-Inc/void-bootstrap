#backend="chroot"

users=(
	'somainline:$5$/UjnRD0B7cDi5Ffh$LqUT25x224Zqb3R2kN7atvRbo.gVr2QXSS9hDGn/EgA:::SoMainline'
)
users_shell_default="/bin/zsh"
users_groups_common+=(
	wheel # sudo
	video input storage bluetooth network
	socklog # svlogtail
	users
)
users_pw_encryption="" # unset if already hashed
users_pw_default="" # disable pass login for e.g. root
users_sudo_askpass=false
#permit_root_login=true
hostname="somainline"

# overwrite systemd-nspawn stub resolv.conf
dns=(
	1.1.1.1
	1.0.0.1
	2606:4700:4700::1111
	2606:4700:4700::1001
)
#mirror="???"
img_name_format="%a-base-rootfs-$(date +'%Y-%m-%d--%H-%M').img"
img_size="3G"
img_compress="xz"
work_dir="work"

#repos=(???)
ignorepkg=(
	# Unneeded FW
	ipw2100-firmware
	ipw2200-firmware
	zd1211-firmware
	wifi-firmware

	# These aren't particularly useful on embedded devices
	ethtool
	acpid
	pciutils

	# Only ext4 formatted images supported (currently)
	btrfs-progs
	xfsprogs

	nvi # We'll replace this crappy editor in base_pkgs
)
rm_pkgs=(
	nvi pciutils btrfs-progs xfsprogs
)
noextract=(
	# No rootfs encryption setup -> avoid extra runit stage
	/etc/crypttab

	# No need for raid -> avoid extra runit stage with additional spam about 4096 block size
	/usr/bin/dmraid
)
base_pkgs=(
	socklog-void elogind dbus-elogind # Main
	#haveged
	fake-hwclock chrony # Time & date
	# TODO: check that fake-hwclock works properly
	bluez # Bluetooth
	NetworkManager # Networking
	crda # WLAN

	zsh zsh-completions zsh-autosuggestions # Shell
	#zsh-history-substring-search zsh-syntax-highlighting
	git htop neovim neofetch psmisc wget curl conspy xtools xxd ripgrep # Some tools
)

extra_build_pkgs=(
	usbd # USB gadget setup
	libmbim libqrtr-glib libqmi ModemManager # Cellular
	qrtr-ns pd-mapper rmtfs tqftpserv diag-router # Modem/WLAN
	gpsd-pds # GPS

	reboot-mode soctemp # Extra tools
	#linuxconsoletools # (e.g. fftest)
)
extra_install_pkgs=(
	usbd
	libqmi ModemManager
	qrtr-ns pd-mapper rmtfs tqftpserv diag-router
	gpsd-pds

	reboot-mode soctemp
	#linuxconsoletools
)
#void_packages="https://github.com/SoMainline/void-packages.git"
#void_packages_branch="somainline"
#void_packages_shallow=true

enable_sv=(
	fake-hwclock chronyd dbus bluetoothd socklog-unix nanoklogd # Main
	#haveged elogind
	sshd

	usbd rndis-tethering # USB gadget setup
	pd-mapper rmtfs tqftpserv diag-router # Modem/WLAN
	NetworkManager # Networking
	gpsd-pds # GPS
)
disable_sv=(
	agetty-tty{2..6} # We don't need more than 1 active tty on embedded devices
	rndis-tethering # Just keep rndis-tethering managed by runit so "sv start rndis-tethering" works
)

overlays=(
	# Mount debugfs at /d
	debugfs

	# Allow running "dmesg" & "ping" without root
	dmesg-noroot
	ping-network-group

	# Let runit manage ModemManager instead of dbus
	modemmanager-runit

	# Resize flashed rootfs on partitions
	resize-root

	# SoMainline user configs etc.
	somainline
)

# Avoid using all threads on the server for package building :)
#XBPS_MAKEJOBS=4
