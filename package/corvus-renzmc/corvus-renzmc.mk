################################################################################
#
# corvus-renzmc
#
################################################################################

CORVUS_RENZMC_VERSION = 1.0.0
CORVUS_RENZMC_SITE = $(call github,RenzMc,RenzmcLang,main)
CORVUS_RENZMC_LICENSE = MIT
CORVUS_RENZMC_LICENSE_FILES = LICENSE
CORVUS_RENZMC_DEPENDENCIES = python3 python3-pip

define CORVUS_RENZMC_INSTALL_TARGET_CMDS
	# Install RenzMcLang using pip
	$(TARGET_CONFIGURE_OPTS) $(HOST_DIR)/bin/pip3 install renzmc
	
	# Create RenzMcLang directory structure
	mkdir -p $(TARGET_DIR)/usr/share/renzmc/examples
	mkdir -p $(TARGET_DIR)/usr/share/renzmc/docs
	mkdir -p $(TARGET_DIR)/usr/bin
	
	# Copy example files
	cp -r $(@D)/examples/* $(TARGET_DIR)/usr/share/renzmc/examples/
	
	# Create RenzMcLang launcher script
	$(INSTALL) -D -m 0755 package/corvus-renzmc/renzmc-launcher \
		$(TARGET_DIR)/usr/bin/renzmc-launcher
	
	# Create symlink for easier access
	ln -sf /usr/local/bin/renzmc $(TARGET_DIR)/usr/bin/renzmc
endef

define CORVUS_RENZMC_INSTALL_INIT_SYSV
	# Add RenzMcLang to PATH in profile
	echo 'export PATH=$$PATH:/usr/local/bin' >> $(TARGET_DIR)/etc/profile
	echo '# RenzMcLang - Corvus OS' >> $(TARGET_DIR)/etc/profile
	echo 'echo "Corvus OS with RenzMcLang - Author: RenzMc"' >> $(TARGET_DIR)/etc/profile
endef

$(eval $(generic-package))