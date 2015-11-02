//VBXCOPYRIGHTTAG
#ifndef VBW_VEC_DIV_H
#define VBW_VEC_DIV_H
#ifdef __cplusplus
template<typename vbx_sp_t>
int vbw_vec_divide(vbx_sp_t *v_out, vbx_sp_t *v_in1, vbx_sp_t *v_in2, unsigned int vl);
extern "C" {
#endif

int vbw_vec_divide_word(vbx_word_t *v_out, vbx_word_t *v_in1, vbx_word_t *v_in2, unsigned int vl);
int vbw_vec_divide_uword(vbx_uword_t *v_out, vbx_uword_t *v_in1, vbx_uword_t *v_in2, unsigned int vl);
int vbw_vec_divide_half(vbx_half_t *v_out, vbx_half_t *v_in1, vbx_half_t *v_in2, unsigned int vl);
int vbw_vec_divide_uhalf(vbx_uhalf_t *v_out, vbx_uhalf_t *v_in1, vbx_uhalf_t *v_in2, unsigned int vl);
int vbw_vec_divide_byte(vbx_byte_t *v_out, vbx_byte_t *v_in1, vbx_byte_t *v_in2, unsigned int vl);
int vbw_vec_divide_ubyte(vbx_ubyte_t *v_out, vbx_ubyte_t *v_in1, vbx_ubyte_t *v_in2, unsigned int vl);

int vbw_vec_divide_ext_word(vbx_word_t *v_out, vbx_word_t *v_in1, vbx_word_t *v_in2, unsigned int vl);
int vbw_vec_divide_ext_uword(vbx_uword_t *v_out, vbx_uword_t *v_in1, vbx_uword_t *v_in2, unsigned int vl);
int vbw_vec_divide_ext_half(vbx_half_t *v_out, vbx_half_t *v_in1, vbx_half_t *v_in2, unsigned int vl);
int vbw_vec_divide_ext_uhalf(vbx_uhalf_t *v_out, vbx_uhalf_t *v_in1, vbx_uhalf_t *v_in2, unsigned int vl);
int vbw_vec_divide_ext_byte(vbx_byte_t *v_out, vbx_byte_t *v_in1, vbx_byte_t *v_in2, unsigned int vl);
int vbw_vec_divide_ext_ubyte(vbx_ubyte_t *v_out, vbx_ubyte_t *v_in1, vbx_ubyte_t *v_in2, unsigned int vl);


#ifdef __cplusplus
}
#endif
#endif //VBW_VEC_DIV_H
