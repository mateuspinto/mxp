//VBXCOPYRIGHTTAG
/**
 * @file
 * @defgroup Sobel Sobel
 * @brief Sobel
 * @ingroup VBXware
 */
///@{

#ifndef __VBX_MTX_SOBEL_H
#define __VBX_MTX_SOBEL_H

#ifdef __cplusplus
extern "C"{
#endif
	int vbw_rgb2luma8(unsigned char *luma, unsigned *rgb, const short image_width, const short image_height, const short image_pitch);

	int vbw_rgb2luma16(unsigned short *luma, unsigned *rgb, const short image_width, const short image_height, const short image_pitch);

	int vbw_sobel_luma8_3x3(unsigned *output, unsigned char *input, const short image_width, const short image_height, const short image_pitch, const short renorm);

	int vbw_sobel_luma16_3x3(unsigned *output, unsigned short *input, const short image_width, const short image_height, const short image_pitch, const short renorm);

	int vbw_sobel_argb32_3x3(unsigned *output, unsigned *input, const short image_width, const short image_height, const short image_pitch, const short renorm);

	int vbw_bifilt_argb32_3x3(unsigned *output, unsigned *input, const short image_width, const short image_height, const short image_pitch, const short renorm);
#ifdef __cplusplus
}
#endif
#endif // __VBX_MTX_SOBEL_H
///@}
