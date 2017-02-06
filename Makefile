include theos/makefiles/common.mk

TWEAK_NAME = BioTap
BioTap_FILES = BioTap.xm
BioTap_FRAMEWORKS = CydiaSubstrate
BioTap_LDFLAGS = -Wl,-segalign,4000

export ARCHS = armv7 arm64
BioTap_ARCHS = armv7 arm64

include $(THEOS_MAKE_PATH)/tweak.mk

	
all::
	@echo "[+] Copying Files..."
	@cp ./obj/obj/debug/BioTap.dylib //Library/MobileSubstrate/DynamicLibraries/BioTap.dylib
	@/usr/bin/ldid -S //Library/MobileSubstrate/DynamicLibraries/BioTap.dylib
	@echo "DONE"
	#@killall SpringBoard
	