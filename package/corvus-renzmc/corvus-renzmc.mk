################################################################################
#
# corvus-renzmc
#
################################################################################

CORVUS_RENZMC_VERSION = latest
CORVUS_RENZMC_SOURCE =
CORVUS_RENZMC_SITE =
CORVUS_RENZMC_LICENSE = MIT
CORVUS_RENZMC_DEPENDENCIES = python3 python-pip

define CORVUS_RENZMC_INSTALL_TARGET_CMDS
	echo "Installing RenzmcLang via pip..."
	$(HOST_DIR)/usr/bin/pip3 install \
		--target=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
		--no-deps \
		renzmc || true
endef

$(eval $(generic-package))
