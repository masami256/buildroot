################################################################################
#
# dvkm
#
################################################################################

DVKM_VERSION = 24e6efa193b5cbb566e20d81c2d9a0c9669e829d
DVKM_SITE = https://github.com/hardik05/Damn_Vulnerable_Kernel_Module.git
DVKM_SITE_METHOD = git
DVKM_LICENSE = GPL-3.0
DVKM_LICENSE_FILES = COPYING

KVERSION=$(LINUX_VERSION_PROBED)

define DVKM_BUILD_CMD
    $(MAKE) -C $(@D) ARCH=$(KERNEL_ARCH) CROSS_COMPILE=$(TARGET_CROSS) -C $(LINUX_DIR) M=$(@D) KCOV=y  modules
endef

define DVKM_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 644 $(@D)/dvkm.ko $(TARGET_DIR)/lib/modules/$(KVERSION)/extra/dvkm.ko
endef

$(eval $(kernel-module))
$(eval $(generic-package))
