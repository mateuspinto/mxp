
############################################################
# This makefile only works for the simulator target so far #
############################################################

all: test.elf

VBXSIM=../../../repository/lib/vbxsim
VBXAPI=../../../repository/lib/vbxapi
test.elf: main.c $(VBXAPI)/libvbxapi.a $(VBXSIM)/libvbxsim.a
	gcc -Wall -g -DVBX_SIMULATOR -I$(VBXAPI) -o $@ $^
$(VBXAPI)/libvbxapi.a  $(VBXSIM)/libvbxsim.a:
	make -C $(dir $@) SIMULATOR=true

clean:
	rm -rf test.elf
	make -C $(VBXAPI) clean SIMULATOR=true
	make -C $(VBXSIM) clean SIMULATOR=true

.phony: all clean
