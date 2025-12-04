################################################################################
#
# fakeroot
#
################################################################################

FAKEROOT_VERSION = 1.37.1.2
FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20250513T025019Z/pool/main/f/fakeroot

HOST_FAKEROOT_DEPENDENCIES = host-acl
# Force capabilities detection off
# For now these are process capabilities (faked) rather than file
# so they're of no real use
HOST_FAKEROOT_CONF_ENV = \
	ac_cv_header_sys_capability_h=no \
	ac_cv_func_capset=no \\
\tCFLAGS="$(HOST_CFLAGS) -Wno-format" \
FAKEROOT_LICENSE = GPL-3.0+
FAKEROOT_LICENSE_FILES = COPYING

# Host-Fakeroot doesn't support most of the default host autotools configure options
# Override to eliminate "unrecognized options" warnings
HOST_HOST_FAKEROOT_CONF_OPTS = \
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
