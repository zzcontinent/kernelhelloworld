ifneq ($(KERNELRELEASE),)
	MODULE_NAME = hellomodule
	$(MODULE_NAME)-objs := hello.o
	obj-m := $(MODULE_NAME).o
else
	KERNEL_DIR = /usr/src/linux-headers-`uname -r`
	MODULEDIR = $(shell pwd)

.PHONY: modules
default: modules

modules: 
	make -C $(KERNEL_DIR) M=$(MODULEDIR)

clean distclean:
	# $(KERNEL_DIR)
	# $(MODULEDIR) 
	# $(KERNELRELEASE) 
	# $(MODULE_NAME)
	rm -f *.o *.mod *.ko *.order *.symvers *.mod.c
	rm -rf .tmp_versions
	rm -rf .*.cmd
endif
