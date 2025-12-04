################################################################################
#
# libffi
#
################################################################################

LIBFFI_VERSION = 3.4.8
LIBFFI_SITE = \
	https://github.com/libffi/libffi/releases/download/v$(LIBFFI_VERSION)
LIBFFI_LICENSE = MIT
LIBFFI_LICENSE_FILES = LICENSE
LIBFFI_CPE_ID_VALID = YES
LIBFFI_INSTALL_STAGING = YES
# We're patching configure.ac
LIBFFI_AUTORECONF = YES
LIBFFI_CONF_OPTS = --disable-multi-os-directory

# The static exec trampolines is enabled by default since
# libffi 3.4.2. However it doesn't work with gobject-introspection.
LIBFFI_CONF_OPTS += --disable-exec-static-tramp

# Libffi doesn't support some of the default configure options
# Override to eliminate "unrecognized options" warnings
LIBFFI_CONF_OPTS += \
	--without-asciidoctor \
	--without-po4a

$(eval $(autotools-package))
# Host-Libffi doesn't support most of the default host autotools configure options
# Override to eliminate "unrecognized options" warnings
HOST_HOST_LIBFFI_CONF_OPTS = \
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
