#!/bin/sh

PRIME_CONF="/etc/fedora-prime/prime-conf"
NVIDIA_CONF="/etc/fedora-prime/10-nvidia.conf.template"
NVIDIA_XORG="/etc/X11/xorg.conf.d/10-nvidia.conf"

FILE_SETTING=`cat "${PRIME_CONF}" 2> /dev/null`
NVIDIA_MODE=${FILE_SETTING:-"off"}

case $NVIDIA_MODE in
	on )
		echo "Enabling nvidia"
		cp "${NVIDIA_CONF}" "${NVIDIA_XORG}"
		/usr/sbin/modprobe nvidia-drm
		# disable power management
		echo "on" | tee "/sys/bus/pci/devices/0000:00:01.0/power/control"
	;;

	off )
		echo "Enabling intel"
		rm -f "${NVIDIA_XORG}"
		#unload modules
		/usr/sbin/rmmod nvidia-drm
		/usr/sbin/rmmod nvidia-uvm
		/usr/sbin/rmmod nvidia-modeset
		/usr/sbin/rmmod nvidia
		# enable power management
		echo "auto" | tee "/sys/bus/pci/devices/0000:00:01.0/power/control"
	;;
esac

udevadm settle --timeout=2
exit 0
