//VBXCOPYRIGHTTAG
#ifndef VBW_VEC_FIR_H
#define VBW_VEC_FIR_H
#include "vbx.h"
#ifdef __cplusplus
extern "C" {
#endif
int vbw_vec_fir_ext_word(vbx_word_t *output, vbx_word_t *input, vbx_word_t *coeffs, const int sample_size, const int num_taps);
int vbw_vec_fir_ext_uword(vbx_uword_t *output, vbx_uword_t *input, vbx_uword_t *coeffs, const int sample_size, const int num_taps);
int vbw_vec_fir_ext_half(vbx_half_t *output, vbx_half_t *input, vbx_half_t *coeffs, const int sample_size, const int num_taps);
int vbw_vec_fir_ext_uhalf(vbx_uhalf_t *output, vbx_uhalf_t *input, vbx_uhalf_t *coeffs, const int sample_size, const int num_taps);
int vbw_vec_fir_ext_byte(vbx_byte_t *output, vbx_byte_t *input, vbx_byte_t *coeffs, const int sample_size, const int num_taps);
int vbw_vec_fir_ext_ubyte(vbx_ubyte_t *output, vbx_ubyte_t *input, vbx_ubyte_t *coeffs, const int sample_size, const int num_taps);

int vbw_vec_fir_transpose_ext_word(vbx_word_t *output, vbx_word_t *input, vbx_word_t *coeffs, const int sample_size, const int num_taps);
int vbw_vec_fir_transpose_ext_uword(vbx_uword_t *output, vbx_uword_t *input, vbx_uword_t *coeffs, const int sample_size, const int num_taps);
int vbw_vec_fir_transpose_ext_half(vbx_half_t *output, vbx_half_t *input, vbx_half_t *coeffs, const int sample_size, const int num_taps);
int vbw_vec_fir_transpose_ext_uhalf(vbx_uhalf_t *output, vbx_uhalf_t *input, vbx_uhalf_t *coeffs, const int sample_size, const int num_taps);
int vbw_vec_fir_transpose_ext_byte(vbx_byte_t *output, vbx_byte_t *input, vbx_byte_t *coeffs, const int sample_size, const int num_taps);
int vbw_vec_fir_transpose_ext_ubyte(vbx_ubyte_t *output, vbx_ubyte_t *input, vbx_ubyte_t *coeffs, const int sample_size, const int num_taps);

#ifdef __cplusplus
}
#endif
#endif //VBW_VEC_FIR_H
