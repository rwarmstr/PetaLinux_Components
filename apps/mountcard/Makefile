ifndef PETALINUX
$(error "Error: PETALINUX environment variable not set.  Change to the root of your PetaLinux install, and source the settings.sh file")
endif

include apps.common.mk

APP = mountcard

all: build install

.PHONY: build
build:	

install: 
	# Update the default fstab to enable the SD card
	mkdir -p $(TARGETDIR)/media/card
	sed -i -e 's/^#\/dev\/mmcblk0p1\(.*\),sync,noauto\(.*\)/\/dev\/mmcblk0p1\1\2/' $(TARGETDIR)/etc/fstab

