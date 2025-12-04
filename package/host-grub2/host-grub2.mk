################################################################################
#
# host-grub2
#
################################################################################

HOST_GRUB2_VERSION = 2.12
HOST_GRUB2_SOURCE = grub-$(HOST_GRUB2_VERSION).tar.xz
HOST_GRUB2_SITE = $(BR2_GNU_MIRROR)/grub
HOST_GRUB2_LICENSE = GPL-3.0+
HOST_GRUB2_LICENSE_FILES = COPYING

HOST_GRUB2_DEPENDENCIES = host-flex host-bison host-gettext

# GRUB2 needs special configure options to avoid warnings
HOST_GRUB2_CONF_OPTS = \
	--disable-werror \
	--disable-nls \
	--without-libiconv-prefix \
	--without-libintl-prefix

$(eval $(host-autotools-package))

# host-grub2 doesn't support most of the default host autotools configure options
# Override to eliminate "unrecognized options" warnings
HOST_HOST_GRUB2_CONF_OPTS = \
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
