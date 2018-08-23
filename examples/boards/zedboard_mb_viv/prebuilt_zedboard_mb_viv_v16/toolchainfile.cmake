# Originally from:
#   http://www.valvers.com/open-software/raspberry-pi/step03-bare-metal-programming-in-c-pt3/
# A CMake toolchain file for cross-compilation

include(CMakeForceCompiler)
set(TOOLCHAINFILE_DIR ${CMAKE_CURRENT_LIST_DIR})
# usage
# cmake -DCMAKE_TOOLCHAIN_FILE=../toolchain-arm-eabi.cmake ../

# The Generic system name is used for embedded targets (targets without OS) in
# CMake
set( CMAKE_SYSTEM_NAME          Generic )
set( CMAKE_SYSTEM_PROCESSOR     ARM )

# Set a toolchain path. You only need to set this if the toolchain isn't in
# your system path. Don't forget a trailing path separator!
set(CROSS_COMPILE mb-)
if(MINGW OR CYGWIN OR WIN32)
  execute_process(
	 COMMAND where ${CROSS_COMPILE}gcc
	 OUTPUT_VARIABLE GCC_PATH
	 OUTPUT_STRIP_TRAILING_WHITESPACE
	 )
elseif(UNIX OR APPLE)
  execute_process(
	 COMMAND which ${CROSS_COMPILE}gcc
	 OUTPUT_VARIABLE GCC_PATH
	 OUTPUT_STRIP_TRAILING_WHITESPACE
	 )
endif()
get_filename_component(TC_PATH ${GCC_PATH} DIRECTORY)

# The toolchain prefix for all toolchain executables

# specify the cross compiler. We force the compiler so that CMake doesn't
# attempt to build a simple test program as this will fail without us using
# the -nostartfiles option on the command line
CMAKE_FORCE_C_COMPILER( ${TC_PATH}/${CROSS_COMPILE}gcc GNU )
CMAKE_FORCE_CXX_COMPILER(${TC_PATH}/${CROSS_COMPILE}g++ GNU )

set(BSP_DIR ${TOOLCHAINFILE_DIR}/bsp/)

link_libraries("-L${BSP_DIR}/microblaze_0/lib/ -Wl,--start-group,-lxil,-lgcc,-lc,-lm,--end-group")

set(CMAKE_EXE_LINKER_FLAGS "-T ${TOOLCHAINFILE_DIR}/etc/lscript.ld" CACHE STRING "")

# Set the CMAKE C flags (which should also be used by the assembler!)
include_directories("${BSP_DIR}/microblaze_0/include")
set( COMPILER_FLAGS "-mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-mul -mcpu=v10.0")
set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS}  ${COMPILER_FLAGS}")
set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${COMPILER_FLAGS}")

set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS}" CACHE STRING "" )
set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}" CACHE STRING "" )
set( CMAKE_ASM_FLAGS "${CMAKE_C_FLAGS}" CACHE STRING "" )
