ifndef PETALINUX
$(error "Error: PETALINUX environment variable not set.  Change to the root of your PetaLinux install, and source the settings.sh file")
endif

include apps.common.mk

APP = lscolors

all: build install

.PHONY: build
build:	

install: 
	# Install the script to create the alias
	mkdir -p $(TARGETDIR)/etc/profile.d
	cp profile.lscolors $(TARGETDIR)/etc/profile.d/profile.lscolors

