//VBXCOPYRIGHTTAG

#ifndef __VBX_COPYRIGHT_H
#define __VBX_COPYRIGHT_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdlib.h>
#include <stdio.h>

#define HEADER_SIZE	4096

#ifdef  STRINGY
#undef  STRINGY
#endif
#define STRINGY(A) #A

#define VBXPROTOHEADER2(fname) vbx_ ## fname ## _info
#define VBXPROTOHEADER1(fname) VBXPROTOHEADER2(fname)



#define VBXCOPYRIGHT(fname) \
char *VBXPROTOHEADER1(fname) () \
{ \
	char *buf = (char *)malloc( HEADER_SIZE ); \
	snprintf( buf, HEADER_SIZE, \
	              "Function " STRINGY(fname) \
	              "\nCopyright (C) 2012-2015 VectorBlox Computing, Inc.\n" \
	              "File " __FILE__ " compiled on " __TIME__ " " __DATE__\
	              " using gcc version " __VERSION__ ".\n" ); \
	return buf; \
}


#ifdef __cplusplus
}
#endif

#endif // __VBX_COPYRIGHT_H
