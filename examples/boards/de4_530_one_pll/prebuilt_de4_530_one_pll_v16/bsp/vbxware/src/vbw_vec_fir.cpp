//VBXCOPYRIGHTTAG
/**@file*/

#include "vbw_vec_fir_template.hpp"

extern "C" int vbw_vec_fir_transpose_ext_word(vbx_word_t *output, vbx_word_t *input, vbx_word_t *coeffs,  int sample_size,  int num_taps){
	return vbw_vec_fir_transpose_ext(output,input,coeffs,sample_size,num_taps);
}
extern "C" int vbw_vec_fir_transpose_ext_uword(vbx_uword_t *output, vbx_uword_t *input, vbx_uword_t *coeffs,  int sample_size,  int num_taps){
	return vbw_vec_fir_transpose_ext(output,input,coeffs,sample_size,num_taps);
}
extern "C" int vbw_vec_fir_transpose_ext_half(vbx_half_t *output, vbx_half_t *input, vbx_half_t *coeffs,  int sample_size,  int num_taps){
	return vbw_vec_fir_transpose_ext(output,input,coeffs,sample_size,num_taps);
}
extern "C" int vbw_vec_fir_transpose_ext_uhalf(vbx_uhalf_t *output, vbx_uhalf_t *input, vbx_uhalf_t *coeffs,  int sample_size,  int num_taps){
	return vbw_vec_fir_transpose_ext(output,input,coeffs,sample_size,num_taps);
}
extern "C" int vbw_vec_fir_transpose_ext_byte(vbx_byte_t *output, vbx_byte_t *input, vbx_byte_t *coeffs,  int sample_size,  int num_taps){
	return vbw_vec_fir_transpose_ext(output,input,coeffs,sample_size,num_taps);
}
extern "C" int vbw_vec_fir_transpose_ext_ubyte(vbx_ubyte_t *output, vbx_ubyte_t *input, vbx_ubyte_t *coeffs,  int sample_size,  int num_taps){
	return vbw_vec_fir_transpose_ext(output,input,coeffs,sample_size,num_taps);
}

extern "C" int vbw_vec_fir_ext_word(vbx_word_t *output, vbx_word_t *input, vbx_word_t *coeffs,  int sample_size,  int num_taps){
	return vbw_vec_fir_ext(output,input,coeffs,sample_size,num_taps);
}
extern "C" int vbw_vec_fir_ext_uword(vbx_uword_t *output, vbx_uword_t *input, vbx_uword_t *coeffs,  int sample_size,  int num_taps){
	return vbw_vec_fir_ext(output,input,coeffs,sample_size,num_taps);
}
extern "C" int vbw_vec_fir_ext_half(vbx_half_t *output, vbx_half_t *input, vbx_half_t *coeffs,  int sample_size,  int num_taps){
	return vbw_vec_fir_ext(output,input,coeffs,sample_size,num_taps);
}
extern "C" int vbw_vec_fir_ext_uhalf(vbx_uhalf_t *output, vbx_uhalf_t *input, vbx_uhalf_t *coeffs,  int sample_size,  int num_taps){
	return vbw_vec_fir_ext(output,input,coeffs,sample_size,num_taps);
}
extern "C" int vbw_vec_fir_ext_byte(vbx_byte_t *output, vbx_byte_t *input, vbx_byte_t *coeffs,  int sample_size,  int num_taps){
	return vbw_vec_fir_ext(output,input,coeffs,sample_size,num_taps);
}
extern "C" int vbw_vec_fir_ext_ubyte(vbx_ubyte_t *output, vbx_ubyte_t *input, vbx_ubyte_t *coeffs,  int sample_size,  int num_taps){
	return vbw_vec_fir_ext(output,input,coeffs,sample_size,num_taps);
}
