################################################################################
#
# grub2
#
################################################################################

GRUB2_VERSION = 2.12
GRUB2_SOURCE = grub-$(GRUB2_VERSION).tar.xz
GRUB2_SITE = $(BR2_GNU_MIRROR)/grub
GRUB2_LICENSE = GPL-3.0+
GRUB2_LICENSE_FILES = COPYING

GRUB2_DEPENDENCIES = host-grub2 host-flex host-bison

# Fix stack protection and linker warnings
GRUB2_CONF_ENV = \
        CFLAGS="$(TARGET_CFLAGS) -fno-stack-protector -Wa,--noexecstack" \
        LDFLAGS="$(TARGET_LDFLAGS) -z noexecstack"

# Fix grub-mkimage path resolution
GRUB2_CONF_OPTS += --with-platform=pc

# GRUB2 is a bootloader, so we only install it to the images directory
GRUB2_INSTALL_IMAGES = YES

GRUB2_TARGET_ARCH = $(call qstrip,$(BR2_ARCH))

ifeq ($(BR2_TARGET_GRUB2_BUILTIN_CONFIG),)
GRUB2_BUILTIN_CONFIG = $(TOPDIR)/board/corvus/grub.cfg
else
GRUB2_BUILTIN_CONFIG = $(TOPDIR)/$(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_CONFIG))
endif

ifeq ($(BR2_TARGET_GRUB2_BOOT_PARTITION),)
GRUB2_BOOT_PARTITION = msdos1
else
GRUB2_BOOT_PARTITION = $(call qstrip,$(BR2_TARGET_GRUB2_BOOT_PARTITION))
endif

ifeq ($(BR2_TARGET_GRUB2_BUILTIN_MODULES),)
GRUB2_BUILTIN_MODULES = boot linux ext2 fat part_msdos
else
GRUB2_BUILTIN_MODULES = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES))
endif

ifeq ($(GRUB2_TARGET_ARCH),x86_64)
GRUB2_IMAGE = $(HOST_DIR)/share/grub/x86_64-efi/core.efi
GRUB2_CFG = $(HOST_DIR)/share/grub/x86_64-efi/grub.cfg
else ifeq ($(GRUB2_TARGET_ARCH),i386)
GRUB2_IMAGE = $(HOST_DIR)/share/grub/i386-pc/core.img
GRUB2_CFG = $(HOST_DIR)/share/grub/i386-pc/grub.cfg
endif

define GRUB2_BUILD_CMDS
        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define GRUB2_INSTALL_IMAGES_CMDS
	mkdir -p $(BINARIES_DIR)
	# Copy the grub.cfg to the correct location
	mkdir -p $(HOST_DIR)/share/grub/$(GRUB2_TARGET_ARCH)-pc
	$(INSTALL) -D -m 0644 $(GRUB2_BUILTIN_CONFIG) $(HOST_DIR)/share/grub/$(GRUB2_TARGET_ARCH)-pc/grub.cfg
\t# Also copy to build directory for grub-mkimage\	mkdir -p $(@D)/board/corvus\	$(INSTALL) -D -m 0644 $(GRUB2_BUILTIN_CONFIG) $(@D)/board/corvus/grub.cfg
	$(INSTALL) -D -m 0755 $(GRUB2_IMAGE) $(BINARIES_DIR)/grub2-image
endef

$(eval $(generic-package))
