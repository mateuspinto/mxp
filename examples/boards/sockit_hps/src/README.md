# Arrow Sockit Development Board

Designed with Quartus V15.0

## Building

Open vblox1.qpf with quartus, and from there launch qsys and open vblox1.qsys.

Add `GIT_ROOT/repository/altera` to your ip search path.

Click the Generate HDL Button.

Exit Qsys

In quartus, run full compilation.

After compilation is finished, from the command line run make from this directory to generate
a bsp for the design.

## Running software

In the directory `GIT_ROOT/examples/software/bmark/vbw_vec_add_t` run
`make PROJ_ROOT=../../../boards/sockit_hps/src` to build the elf.

Download the bitstream and preloader with the command:
`make PROJ_ROOT=../../../boards/sockit_hps/src pgm download-preloader`

Download the vector add benchmark with the command:
`make PROJ_ROOT=../../../boards/sockit_hps/src pgm download-elf`
