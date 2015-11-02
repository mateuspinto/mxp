//VBXCOPYRIGHTTAG
#ifndef VBW_VEC_COPY_H
#define VBW_VEC_COPY_H

#ifdef __cplusplus
template<typename vbx_sp_t>
int vbw_vec_copy( vbx_sp_t *v_dst, vbx_sp_t *v_src, const int N);
template<typename vbx_mm_t>
int vbw_vec_copy_ext( vbx_word_t *dst, vbx_word_t *src, const int N );

extern "C" {
#endif

int vbw_vec_copy_word ( vbx_word_t *v_dst, vbx_word_t *v_src, const int N);
int vbw_vec_copy_uword( vbx_uword_t *v_dst, vbx_uword_t *v_src, const int N);
int vbw_vec_copy_half ( vbx_half_t *v_dst, vbx_half_t *v_src, const int N);
int vbw_vec_copy_uhalf( vbx_uhalf_t *v_dst, vbx_uhalf_t *v_src, const int N);
int vbw_vec_copy_byte ( vbx_byte_t *v_dst, vbx_byte_t *v_src, const int N);
int vbw_vec_copy_ubyte( vbx_ubyte_t *v_dst, vbx_ubyte_t *v_src, const int N);


int vbw_vec_copy_ext_word ( vbx_word_t *dst, vbx_word_t *src, const int N );
int vbw_vec_copy_ext_uword( vbx_uword_t *dst, vbx_uword_t *src, const int N );
int vbw_vec_copy_ext_half ( vbx_half_t *dst, vbx_half_t *src, const int N );
int vbw_vec_copy_ext_uhalf( vbx_uhalf_t *dst, vbx_uhalf_t *src, const int N );
int vbw_vec_copy_ext_byte ( vbx_byte_t *dst, vbx_byte_t *src, const int N );
int vbw_vec_copy_ext_ubyte( vbx_ubyte_t *dst, vbx_ubyte_t *src, const int N );

#ifdef __cplusplus
}
#endif

#endif //VBW_VEC_COPY_H
