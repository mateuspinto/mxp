
############################################################
# This makefile only works for the simulator target so far #
############################################################

all: test.elf

VBXSIM=../../../repository/lib/vbxsim
VBXAPI=../../../repository/lib/vbxapi
test.elf: main.c $(VBXAPI)/libvbxapi.a $(VBXSIM)/libvbxsim.a
	gcc -Wall -g -DVBX_SIMULATOR -I$(VBXAPI) -o $@ $^
$(VBXAPI)/libvbxapi.a  $(VBXSIM)/libvbxsim.a:
	make -C $(dir $@)

clean:
	rm test.elf
	make -C $(VBXAPI) clean
	make -C $(VBXSIM) clean

.phony: all clean
