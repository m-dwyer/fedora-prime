INSTALL_DIR=/etc/fedora-prime

install:
	mkdir -p $(INSTALL_DIR)
	cp ./lightdm.conf.template /etc/lightdm/lightdm.conf.d/90-nvidia.conf
	cp ./10-nvidia.conf.template $(INSTALL_DIR)
	cp ./11-intel.conf.template $(INSTALL_DIR)
	cp ./nvidia-blacklist.conf.template $(INSTALL_DIR)
	cp ./prime-select.sh /usr/sbin/prime-select.sh
	chmod o+x /usr/sbin/prime-select.sh
	cp ./prime-offload.sh /usr/sbin/prime-offload.sh
	chmod o+x /usr/sbin/prime-offload.sh
	cp ./prime-switch.sh /usr/sbin/prime-switch.sh
	chmod o+x /usr/sbin/prime-switch.sh
