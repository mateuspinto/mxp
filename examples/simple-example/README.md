# Simple Example

This directory contains the simplest example possible for creating a program
that utilizes the Vectorblox MXP.

This Readme gives instructions on how to build under various environments

To build the c++ example, use g++ instead of gcc, and use main.cpp instead of main.c
in the commands below
.
## Simulator

To use these instructions you need to know the directory that the package is
downloaded to.

```
VBXSIM=<path/to/simulotor/> #probably PACKAGE_DIR/repository/lib/vbxsim
make -C  $VBXSIM SIMULATOR=true
VBXAPI=<path/to/vbxapi/> #probably PACKAGE_DIR/repository/lib/vbxapi
make -C  $VBXAPI SIMULATOR=true
gcc -Wall -g main.c -DVBX_SIMULATOR -o simple $VBXAPI/libvbxapi.a $VBXSIM/libvbxsim.a -I$VBXAPI
```
You can also use the `make` command to do these steps automatically
