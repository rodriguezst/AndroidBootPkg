# EDK2 build configuration
WORKSPACE ?= $(PWD)
EDK2_PATH ?= $(WORKSPACE)/edk2
PACKAGES_PATH ?= $(EDK2_PATH):$(WORKSPACE)
ARCH ?= AARCH64
TOOLCHAIN ?= GCC5
BUILD_TYPE ?= RELEASE
SHELL := /bin/bash

# EDK2 tools configuration
EDK_TOOLS_PATH ?= $(EDK2_PATH)/BaseTools
PYTHON_COMMAND ?= python3

# Package-specific settings
PACKAGE_NAME = AndroidBootPkg
PACKAGE_PATH = $(EDK2_PATH)/$(PACKAGE_NAME)
OUTPUT_DIR = Build/$(PACKAGE_NAME)/$(BUILD_TYPE)_$(TOOLCHAIN)/$(ARCH)

.PHONY: all clean

all: setup build

setup:
	@if [ -z "$(EDK2_PATH)" ]; then \
		echo "Error: EDK2_PATH environment variable not set"; \
		echo "Please set EDK2_PATH to your EDK2 installation directory"; \
		exit 1; \
	fi
	@if [ ! -d "$(EDK2_PATH)" ]; then \
		echo "Error: EDK2 directory not found at $(EDK2_PATH)"; \
		exit 1; \
	fi
	@echo "Using EDK2 from: $(EDK2_PATH)"
	@if [ ! -f "$(EDK_TOOLS_PATH)/Source/C/bin/GenFv" ]; then \
		echo "Building EDK2 BaseTools..."; \
		$(MAKE) -C $(EDK_TOOLS_PATH); \
	fi
	@if [ ! -f "$(EDK2_PATH)/Conf/target.txt" ]; then \
		echo "Setting up EDK2 configuration..."; \
		cd $(EDK2_PATH) && source edksetup.sh --reconfig; \
	fi
	@if [ ! -d "$(EDK2_PATH)/$(PACKAGE_NAME)" ]; then \
		echo "Copying $(PACKAGE_NAME) to EDK2 path..."; \
		cp -rf $(WORKSPACE)/$(PACKAGE_NAME) $(EDK2_PATH)/; \
	fi

build:
	cd $(EDK2_PATH) && \
	source edksetup.sh && \
	build -p $(PACKAGE_PATH)/$(PACKAGE_NAME).dsc \
		-a $(ARCH) \
		-t $(TOOLCHAIN) \
		-b $(BUILD_TYPE)

clean:
	@rm -rf Build/
	@rm -f *.efi

# Development helper targets
rebuild: clean all

# Print build configuration
info:
	@echo "Build Configuration:"
	@echo "  WORKSPACE:     $(WORKSPACE)"
	@echo "  PACKAGES_PATH: $(PACKAGES_PATH)"
	@echo "  ARCH:         $(ARCH)"
	@echo "  TOOLCHAIN:    $(TOOLCHAIN)"
	@echo "  BUILD_TYPE:   $(BUILD_TYPE)"
	@echo "  OUTPUT_DIR:   $(OUTPUT_DIR)"
	@echo "  EDK_TOOLS_PATH: $(EDK_TOOLS_PATH)"
