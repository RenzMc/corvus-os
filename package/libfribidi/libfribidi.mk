################################################################################
#
# libfribidi
#
################################################################################

LIBFRIBIDI_VERSION = 1.0.16
LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.xz
LIBFRIBIDI_SITE = https://github.com/fribidi/fribidi/releases/download/v$(LIBFRIBIDI_VERSION)
LIBFRIBIDI_LICENSE = LGPL-2.1+
LIBFRIBIDI_LICENSE_FILES = COPYING
LIBFRIBIDI_CPE_ID_VENDOR = gnu
LIBFRIBIDI_CPE_ID_PRODUCT = fribidi
LIBFRIBIDI_INSTALL_STAGING = YES
LIBFRIBIDI_DEPENDENCIES = host-pkgconf

# Libfribidi doesn't support some of the default configure options
# Override to eliminate "unrecognized options" warnings
LIBFRIBIDI_CONF_OPTS += \
	--without-asciidoctor \
	--without-po4a

$(eval $(autotools-package))
$(eval $(host-autotools-package))
