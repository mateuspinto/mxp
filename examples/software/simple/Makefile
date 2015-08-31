
############################################################
# This makefile only works for the simulator target so far #
############################################################

all: test.elf

VBXSIM=../../../repository/lib/vbxsim
VBXAPI=../../../repository/lib/vbxapi

CPP?=false

ifeq ($(CPP),true)
test.elf: test.cpp $(VBXAPI)/libvbxapi.a $(VBXSIM)/libvbxsim.a
	g++ -Wall -g -DVBX_SIMULATOR -I$(VBXAPI) -o $@ $^
else
test.elf: test.c $(VBXAPI)/libvbxapi.a $(VBXSIM)/libvbxsim.a
	gcc -Wall -g -DVBX_SIMULATOR -I$(VBXAPI) -o $@ $^
endif


$(VBXAPI)/libvbxapi.a  $(VBXSIM)/libvbxsim.a:
	make -C $(dir $@) SIMULATOR=true

clean:
	rm -rf test.elf
	make -C $(VBXAPI) clean SIMULATOR=true
	make -C $(VBXSIM) clean SIMULATOR=true

.phony: all clean
