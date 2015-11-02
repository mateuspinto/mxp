//VBXCOPYRIGHTTAG
#ifndef VBW_MTX_MEDIAN_H
#define VBW_MTX_MEDIAN_H
#ifdef __cplusplus
template<typename vbx_mm_t>
int vbw_mtx_median_ext( vbx_mm_t *output, vbx_mm_t *input, const int filter_height, const int filter_width,
                        const int image_height, const int image_width, const int image_pitch );
extern "C" {
#endif


int vbw_mtx_median_ext_word( vbx_word_t *output, vbx_word_t *input, const int filter_height, const int filter_width,
                             const int image_height, const int image_width, const int image_pitch );
int vbw_mtx_median_ext_uword( vbx_uword_t *output, vbx_uword_t *input, const int filter_height, const int filter_width,
                              const int image_height, const int image_width, const int image_pitch );
int vbw_mtx_median_ext_half( vbx_half_t *output, vbx_half_t *input, const int filter_height, const int filter_width,
                             const int image_height, const int image_width, const int image_pitch );
int vbw_mtx_median_ext_uhalf( vbx_uhalf_t *output, vbx_uhalf_t *input, const int filter_height, const int filter_width,
                              const int image_height, const int image_width, const int image_pitch );
int vbw_mtx_median_ext_byte( vbx_byte_t *output, vbx_byte_t *input, const int filter_height, const int filter_width,
                             const int image_height, const int image_width, const int image_pitch );
int vbw_mtx_median_ext_ubyte( vbx_ubyte_t *output, vbx_ubyte_t *input, const int filter_height, const int filter_width,
                              const int image_height, const int image_width, const int image_pitch );
#ifdef __cplusplus
}
#endif

#endif //VBW_MTX_MEDIAN_H
