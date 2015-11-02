//VBXCOPYRIGHTTAG
#ifndef VBW_VEC_REV_H
#define VBW_VEC_REV_H

#ifdef __cplusplus
template<typename vbx_mm_t>
int vbw_vec_reverse_ext( vbx_mm_t *dst, vbx_mm_t *src, const unsigned int N );
template<typename vbx_sp_t>
int vbw_vec_reverse( vbx_sp_t *v_dst, vbx_sp_t *v_src, const unsigned int N );
extern "C" {
#endif

int vbw_vec_reverse_word( vbx_word_t *v_dst, vbx_word_t *v_src, const unsigned int N );
int vbw_vec_reverse_uword( vbx_uword_t *v_dst, vbx_uword_t *v_src, const unsigned int N );
int vbw_vec_reverse_half( vbx_half_t *v_dst, vbx_half_t *v_src, const unsigned int N );
int vbw_vec_reverse_uhalf( vbx_uhalf_t *v_dst, vbx_uhalf_t *v_src, const unsigned int N );
int vbw_vec_reverse_byte( vbx_byte_t *v_dst, vbx_byte_t *v_src, const unsigned int N );
int vbw_vec_reverse_ubyte( vbx_ubyte_t *v_dst, vbx_ubyte_t *v_src, const unsigned int N );

int vbw_vec_reverse_ext_word( vbx_word_t *dst, vbx_word_t *src, const unsigned int N );
int vbw_vec_reverse_ext_uword( vbx_uword_t *dst, vbx_uword_t *src, const unsigned int N );
int vbw_vec_reverse_ext_half( vbx_half_t *dst, vbx_half_t *src, const unsigned int N );
int vbw_vec_reverse_ext_uhalf( vbx_uhalf_t *dst, vbx_uhalf_t *src, const unsigned int N );
int vbw_vec_reverse_ext_byte( vbx_byte_t *dst, vbx_byte_t *src, const unsigned int N );
int vbw_vec_reverse_ext_ubyte( vbx_ubyte_t *dst, vbx_ubyte_t *src, const unsigned int N );
#ifdef __cplusplus
}
#endif
#endif //VBW_VEC_REV_H
