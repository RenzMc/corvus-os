################################################################################
#
# m4
#
################################################################################

M4_VERSION = 1.4.20
M4_SOURCE = m4-$(M4_VERSION).tar.xz
M4_SITE = $(BR2_GNU_MIRROR)/m4
M4_LICENSE = GPL-3.0+
M4_LICENSE_FILES = COPYING

# M4 doesn't support most of the default host autotools configure options
# Override to eliminate "unrecognized options" warnings
HOST_M4_CONF_OPTS = \
        --disable-shared \
        --disable-static \
        --disable-gtk-doc \
        --disable-gtk-doc-html \
        --disable-doc \
        --disable-docs \
        --disable-documentation \
        --with-xmlto=no \
        --with-fop=no \
        --disable-nls

# Host-M4 doesn't support most of the default host autotools configure options
# Override to eliminate "unrecognized options" warnings
HOST_HOST_M4_CONF_OPTS = \
	--disable-shared \
	--enable-static \
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
