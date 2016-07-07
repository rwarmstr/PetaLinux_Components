BOOT_FSBL_IMAGE = images/linux/zynqmp_fsbl.elf
BOOT_BIT_IMAGE = subsystems/linux/hw-description/ .bit
BOOT_UBOOT_IMAGE = images/linux/u-boot.elf
BOOT_IMAGE = images/linux/boot.bin
KERNEL_IMAGE = images/linux/image.ub
IMAGE_COPY_DIR = 
VIVADO_IMAGE = 
SYSTEM_BIF = 

.PHONY: linux bootimage stresstest fsbl dts build-dts dump-dts hw-description

all: linux bootimage

dts: build-dts package bootimage

rootfs: build-rootfs package bootimage

hw-description:
	petalinux-config --get-hw-description=${VIVADO_IMAGE}

fsbl:
	petalinux-build -c bootloader

clean:
	petalinux-build -x distclean

linux:
	petalinux-build

build-dts:
	petalinux-build -c device-tree

dump-dts:
	build/linux/kernel/link-to-kernel-build/scripts/dtc/dtc -I dtb -O dts -o dump.dts images/linux/system.dtb 

build-rootfs:
	petalinux-build -c rootfs

package:
	petalinux-build -x package

bootimage:
	petalinux-package --boot --force --fsbl ${BOOT_FSBL_IMAGE} --fpga ${BOOT_BIT_IMAGE} --u-boot=${BOOT_UBOOT_IMAGE} -o ${BOOT_IMAGE}
	#cp images/linux/boot.bin ${IMAGE_COPY_DIR}
	#cp images/linux/image.ub ${IMAGE_COPY_DIR}
