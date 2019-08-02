#!/usr/bin/env bash
set -e

BLACKLIST_CONF="/etc/fedora-prime/nvidia-blacklist.conf.template"
BLACKLIST_FILE="/lib/modprobe.d/nvidia-blacklist.conf"

PRIME_CONF="/etc/fedora-prime/prime-conf"

case $1 in
	nvidia )
		echo "Enabling nvidia"
		rm -f "${BLACKLIST_FILE}"
		echo "on" > "${PRIME_CONF}"
		;;
	intel )
		echo "Enabling intel"
		cp "${BLACKLIST_CONF}" "${BLACKLIST_FILE}"
		echo "off" > "${PRIME_CONF}"
		;;
	query )
		FILE_SETTING=`cat "${PRIME_CONF}" 2> /dev/null`
		NVIDIA_MODE=${FILE_SETTING:-"off"}
		if [[ "${NVIDIA_MODE}" == "on" ]]; then echo "nvidia"; else echo "intel"; fi
		;;
	* )
		echo "Usage: intel|nvidia|query"
		exit 0
		;;
esac
