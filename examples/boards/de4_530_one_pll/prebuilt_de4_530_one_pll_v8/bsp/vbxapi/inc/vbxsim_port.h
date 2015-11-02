//VBXCOPYRIGHTTAG

#ifndef __VBXSIM_PORT_H
#define __VBXSIM_PORT_H

// VBX Simulator Portability library

#define VBX_CPU_DCACHE_LINE_SIZE 16

typedef uint64_t vbx_timestamp_t;
extern vbx_timestamp_t vbxsim_timestamp;

#define vbx_timestamp_start()
#define vbx_timestamp()	                ++vbxsim_timestamp;

#define vbx_timestamp_freq() \
	({ \
		vbx_mxp_t *this_mxp = VBX_GET_THIS_MXP(); \
		this_mxp->core_freq; \
	})

// converts timestamp cycles into mxp cycles
#define vbx_mxp_cycles(TS_CYCLES) \
	({ \
		(vbx_timestamp_t)( (float) (TS_CYCLES) ); \
	})

#define vbx_uncached_malloc(BYTES)	malloc(BYTES)
#define vbx_uncached_free(PTR)		free(PTR)

#define vbx_dcache_flush_all()
#define vbx_dcache_flush_line(PTR)
#define vbx_dcache_flush(PTR,LEN)

#define vbx_remap_cached(PTR,LEN)			PTR
#define vbx_remap_uncached(PTR)				PTR
#define vbx_remap_uncached_flush(PTR,LEN)	        PTR


#endif // __VBXSIM_PORT_H
