INSTALL_DIR=/etc/fedora-prime

install:
	mkdir -p $(INSTALL_DIR)
	cp ./lightdm.conf.template /etc/lightdm/lightdm.conf.d/90-nvidia.conf
	cp ./nvidia-kms.conf /lib/modprobe.d/
	cp ./10-nvidia.conf.template $(INSTALL_DIR)
	cp ./11-intel.conf.template $(INSTALL_DIR)
	cp ./nvidia-blacklist.conf.template $(INSTALL_DIR)
	cp ./prime-select /usr/sbin/prime-select
	chmod +x /usr/sbin/prime-select
	cp ./prime-offload.sh /usr/sbin/prime-offload.sh
	chmod +x /usr/sbin/prime-offload.sh
	cp ./prime-switch.sh /usr/sbin/prime-switch.sh
	chmod +x /usr/sbin/prime-switch.sh

uninstall:
	rm -rf $(INSTALL_DIR)
	rm -f /etc/lightdm/lightdm.conf.d/90-nvidia.conf
	rm -f /lib/modprobe.d/nvidia-kms.conf
	rm -f /usr/sbin/prime-select
	rm -f /usr/sbin/prime-offload.sh
	rm -f /usr/sbin/prime-switch.sh
