#
# Copyright (c) 2011 The Chromium OS Authors.
#
# SPDX-License-Identifier:	GPL-2.0+
#

# This Makefile builds the internal U-Boot fdt if CONFIG_OF_CONTROL is
# enabled. See doc/README.fdt-control for more details.

# CONFIG_DEFAULT_DEVICE_TREE="imx6ull-14x14-evk"
DEVICE_TREE ?= $(CONFIG_DEFAULT_DEVICE_TREE:"%"=%)
ifeq ($(DEVICE_TREE),)
DEVICE_TREE := unset
endif

ifneq ($(EXT_DTB),)
DTB := $(EXT_DTB)
else
DTB := arch/$(ARCH)/dts/$(DEVICE_TREE).dtb
endif
# cmd_shipped = cat $< > $@
$(obj)/dt.dtb: $(DTB) FORCE
	$(call if_changed,shipped)

targets += dt.dtb

$(DTB): arch-dtbs
	$(Q)test -e $@ || (						\
	echo >&2;							\
	echo >&2 "Device Tree Source is not correctly specified.";	\
	echo >&2 "Please define 'CONFIG_DEFAULT_DEVICE_TREE'";		\
	echo >&2 "or build with 'DEVICE_TREE=<device_tree>' argument";	\
	echo >&2;							\
	/bin/false)

arch-dtbs:
	$(Q)$(MAKE) $(build)=arch/$(ARCH)/dts dtbs

.SECONDARY: $(obj)/dt.dtb.S

obj-$(CONFIG_OF_EMBED) := dt.dtb.o

dtbs: $(obj)/dt.dtb
	@:

clean-files := dt.dtb.S

# Let clean descend into dts directories
subdir- += ../arch/arm/dts ../arch/microblaze/dts ../arch/mips/dts ../arch/sandbox/dts ../arch/x86/dts
