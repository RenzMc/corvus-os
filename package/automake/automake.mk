################################################################################
#
# automake
#
################################################################################

AUTOMAKE_VERSION = 1.16.5
AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.xz
AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
AUTOMAKE_LICENSE = GPL-2.0+
AUTOMAKE_LICENSE_FILES = COPYING
AUTOMAKE_CPE_ID_VENDOR = gnu

HOST_AUTOMAKE_DEPENDENCIES = host-autoconf

ACLOCAL_HOST_DIR = $(HOST_DIR)/share/aclocal

# Automake doesn't support most of the default host autotools configure options
# Override to eliminate "unrecognized options" warnings
HOST_AUTOMAKE_CONF_OPTS = \
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

define HOST_AUTOMAKE_GTK_DOC_M4_INSTALL
	$(INSTALL) -D -m 0644 package/automake/gtk-doc.m4 \
		$(ACLOCAL_HOST_DIR)/gtk-doc.m4
endef

# ensure staging aclocal dir exists
define HOST_AUTOMAKE_MAKE_ACLOCAL
	mkdir -p $(ACLOCAL_DIR)
endef

HOST_AUTOMAKE_POST_INSTALL_HOOKS += HOST_AUTOMAKE_GTK_DOC_M4_INSTALL
HOST_AUTOMAKE_POST_INSTALL_HOOKS += HOST_AUTOMAKE_MAKE_ACLOCAL

# Host-Automake doesn't support most of the default host autotools configure options
# Override to eliminate "unrecognized options" warnings
HOST_HOST_AUTOMAKE_CONF_OPTS = \
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

# variables used by other packages
AUTOMAKE = $(HOST_DIR)/bin/automake
ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
ACLOCAL = $(HOST_DIR)/bin/aclocal
ACLOCAL_PATH = $(ACLOCAL_DIR):$(ACLOCAL_HOST_DIR)
export ACLOCAL_PATH
