################################################################################
#
# autoconf-archive
#
################################################################################

AUTOCONF_ARCHIVE_VERSION = 2023.02.20
AUTOCONF_ARCHIVE_SOURCE = autoconf-archive-$(AUTOCONF_ARCHIVE_VERSION).tar.xz
AUTOCONF_ARCHIVE_SITE = $(BR2_GNU_MIRROR)/autoconf-archive
AUTOCONF_ARCHIVE_LICENSE = GPL-3.0+ with exception
AUTOCONF_ARCHIVE_LICENSE_FILES = COPYING COPYING.EXCEPTION
HOST_AUTOCONF_ARCHIVE_INSTALL_OPTS = aclocaldir=$(HOST_DIR)/share/autoconf-archive install

# Autoconf-archive doesn't support most of the default host autotools configure options
# Override to eliminate "unrecognized options" warnings
HOST_AUTOCONF_ARCHIVE_CONF_OPTS = \
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
        --disable-nls \
        --disable-dependency-tracking

# Host-Autoconf-Archive doesn't support most of the default host autotools configure options
# Override to eliminate "unrecognized options" warnings
HOST_HOST_AUTOCONF_ARCHIVE_CONF_OPTS = \
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
	--disable-nls \\\n	--disable-dependency-tracking

$(eval $(host-autotools-package))
