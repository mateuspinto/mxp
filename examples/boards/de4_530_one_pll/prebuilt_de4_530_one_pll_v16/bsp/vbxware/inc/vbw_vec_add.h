//VBXCOPYRIGHTTAG
#ifndef VBW_VEC_ADD_H
#define VBW_VEC_ADD_H
#ifdef __cplusplus
extern "C" {
#endif

int vbw_vec_add_word(vbx_word_t *v_out, vbx_word_t *v_in1, vbx_word_t *v_in2, unsigned int vl);
int vbw_vec_add_uword(vbx_uword_t *v_out, vbx_uword_t *v_in1, vbx_uword_t *v_in2, unsigned int vl);
int vbw_vec_add_half(vbx_half_t *v_out, vbx_half_t *v_in1, vbx_half_t *v_in2, unsigned int vl);
int vbw_vec_add_uhalf(vbx_uhalf_t *v_out, vbx_uhalf_t *v_in1, vbx_uhalf_t *v_in2, unsigned int vl);
int vbw_vec_add_byte(vbx_byte_t *v_out, vbx_byte_t *v_in1, vbx_byte_t *v_in2, unsigned int vl);
int vbw_vec_add_ubyte(vbx_ubyte_t *v_out, vbx_ubyte_t *v_in1, vbx_ubyte_t *v_in2, unsigned int vl);

#ifdef __cplusplus
}
#endif
#endif //VBW_VEC_ADD_H
