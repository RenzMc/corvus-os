################################################################################
#
# expat
#
################################################################################

EXPAT_VERSION = 2.7.3
EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
EXPAT_INSTALL_STAGING = YES
EXPAT_LICENSE = MIT
EXPAT_LICENSE_FILES = COPYING
EXPAT_CPE_ID_VENDOR = libexpat_project
EXPAT_CPE_ID_PRODUCT = libexpat

EXPAT_CONF_OPTS = \
	--without-docbook --without-examples --without-tests --without-xmlwf
HOST_EXPAT_CONF_OPTS = --without-docbook --without-examples --without-tests

# Expat doesn't support some of the default configure options
# Override to eliminate "unrecognized options" warnings
EXPAT_CONF_OPTS += \
	--without-asciidoctor \
	--without-po4a

$(eval $(autotools-package))
# Host-Expat doesn't support most of the default host autotools configure options
# Override to eliminate "unrecognized options" warnings
HOST_HOST_EXPAT_CONF_OPTS = \
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
