################################################################################
#
# patchelf
#
################################################################################

PATCHELF_VERSION = 0.13
PATCHELF_SITE = \
	https://github.com/NixOS/patchelf/releases/download/$(PATCHELF_VERSION)
PATCHELF_SOURCE = patchelf-$(PATCHELF_VERSION).tar.bz2
PATCHELF_LICENSE = GPL-3.0+
PATCHELF_LICENSE_FILES = COPYING

# Host-Patchelf doesn't support most of the default host autotools configure options
# Override to eliminate "unrecognized options" warnings
HOST_HOST_PATCHELF_CONF_OPTS = \
	--disable-shared \
	--disable-static \
	--disable-gtk-doc \
	--disable-gtk-doc-html \
	--disable-doc \
	--disable-docs \
	--disable-documentation \
	--disable-debug \
	--with-xmlto=no \
	--with-fop=no \
	--disable-nls

$(eval $(host-autotools-package))
