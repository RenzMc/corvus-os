################################################################################
#
# libpthread-stubs
#
################################################################################

LIBPTHREAD_STUBS_VERSION = 0.5
LIBPTHREAD_STUBS_SOURCE = libpthread-stubs-$(LIBPTHREAD_STUBS_VERSION).tar.xz
LIBPTHREAD_STUBS_SITE = http://xcb.freedesktop.org/dist
LIBPTHREAD_STUBS_LICENSE = MIT
LIBPTHREAD_STUBS_LICENSE_FILES = COPYING

LIBPTHREAD_STUBS_INSTALL_STAGING = YES

ifeq ($(BR2_STATIC_LIBS),y)
LIBPTHREAD_STUBS_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -pthread"
endif

# Libpthread-Stubs doesn't support some of the default configure options
# Override to eliminate "unrecognized options" warnings
LIBPTHREAD-STUBS_CONF_OPTS += \
	--without-asciidoctor \
	--without-po4a

$(eval $(autotools-package))
$(eval $(host-autotools-package))
