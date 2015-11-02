//VBXCOPYRIGHTTAG
#ifndef VBW_MTX_FIR_H
#define VBW_MTX_FIR_H
#ifdef __cplusplus
template<typename vbx_mm_t>
void vbw_mtx_2Dfir(vbx_mm_t *output, vbx_mm_t *input, int32_t *coeffs, const int num_row, const int num_column, const int ntaps_row, const int ntaps_column );
extern "C" {
#endif
void vbw_mtx_2Dfir_word(vbx_word_t *output, vbx_word_t *input, int32_t *coeffs, const int num_row, const int num_column, const int ntaps_row, const int ntaps_column );
void vbw_mtx_2Dfir_uword(vbx_uword_t *output, vbx_uword_t *input, int32_t *coeffs, const int num_row, const int num_column, const int ntaps_row, const int ntaps_column );
void vbw_mtx_2Dfir_half(vbx_half_t *output, vbx_half_t *input, int32_t *coeffs, const int num_row, const int num_column, const int ntaps_row, const int ntaps_column );
void vbw_mtx_2Dfir_uhalf(vbx_uhalf_t *output, vbx_uhalf_t *input, int32_t *coeffs, const int num_row, const int num_column, const int ntaps_row, const int ntaps_column );
void vbw_mtx_2Dfir_byte(vbx_byte_t *output, vbx_byte_t *input, int32_t *coeffs, const int num_row, const int num_column, const int ntaps_row, const int ntaps_column );
void vbw_mtx_2Dfir_ubyte(vbx_ubyte_t *output, vbx_ubyte_t *input, int32_t *coeffs, const int num_row, const int num_column, const int ntaps_row, const int ntaps_column );
#ifdef __cplusplus
}
#endif
#endif //VBW_MTX_FIR_H
