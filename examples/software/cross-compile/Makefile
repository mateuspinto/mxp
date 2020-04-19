
############################################################
# This makefile only works for the simulator target so far #
############################################################

all: test-cpp.elf test-c.elf

VBXSIM=../../../repository/lib/vbxsim
VBXAPI=../../../repository/lib/vbxapi

CROSS_COMPILE=aarch64-linux-gnu-

export CROSS_COMPILE


test-cpp.elf: test-cpp.cpp $(VBXAPI)/libvbxapi.a $(VBXSIM)/libvbxsim.a
	$(CROSS_COMPILE)g++ -Wall -g -DVBX_SIMULATOR -I$(VBXAPI) -o $@ $^ -static

test-c.elf: test-c.c $(VBXAPI)/libvbxapi.a $(VBXSIM)/libvbxsim.a
	$(CROSS_COMPILE)gcc -Wall -g -std=c99 -DVBX_SIMULATOR -I$(VBXAPI) -o $@ $^ -static


$(VBXAPI)/libvbxapi.a  $(VBXSIM)/libvbxsim.a:
	make -C $(dir $@) SIMULATOR=true

clean:
	rm -rf test-c.elf
	rm -rf test-cpp.elf
	make -C $(VBXAPI) clean SIMULATOR=true
	make -C $(VBXSIM) clean SIMULATOR=true

.phony: all clean