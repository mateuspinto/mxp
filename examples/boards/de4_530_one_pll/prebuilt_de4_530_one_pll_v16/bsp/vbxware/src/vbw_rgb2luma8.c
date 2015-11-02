// VBXCOPYRIGHTTAG
/**@file*/
#include "vbx_copyright.h"
VBXCOPYRIGHT(vbw_rgb2luma8)

#include "vbx.h"
#include "vbw_exit_codes.h"

/** Converts RGB frame to 8-bit luma.
 * @brief Convert RGB frame to 8-bit luma using Bt.601 coefficients.
 * @pre needs at least 13*image_width (more depending on SP width) bytes of available scratch.
 *
 * @param[out] luma         8-bit luma pixel output
 * @param[in] rgb          32-bit aRGB pixel input
 * @param[in] image_width  input/output image width
 * @param[in] image_height input/output image height
 * @param[in] image_pitch  input/output image pitch
 *
 * @returns negative on error condition. See vbw_exit_codes.h
 */
int vbw_rgb2luma8(unsigned char *luma, unsigned *rgb, const short image_width, const short image_height, const short image_pitch)
{

	vbx_uword_t *v_row_in, *v_row_in_next, *tmp_ptr;
	vbx_ubyte_t *v_row_out;
	vbx_uhalf_t *v_luma, *v_temp;
	int          i;
	int vector_bytes = image_width*sizeof(vbx_uword_t);

	vbx_set_vl(image_width);

	vbx_sp_push();

	// Allocate scratchpad memory for vectors
	v_row_in      = (vbx_uword_t *)vbx_sp_malloc(vector_bytes);
	v_row_in_next = (vbx_uword_t *)vbx_sp_malloc(vector_bytes);
	v_luma        = (vbx_uhalf_t *)vbx_sp_malloc(vector_bytes>>1);
	v_temp        = (vbx_uhalf_t *)vbx_sp_malloc(vector_bytes>>1);
	v_row_out     = (vbx_ubyte_t *)vbx_sp_malloc(vector_bytes>>2);
	if( v_row_out == NULL){
		vbx_sp_pop();
		return VBW_ERROR_SP_ALLOC_FAILED;
	}
	// Transfer the first input row to scratchpad
	vbx_dma_to_vector(v_row_in, rgb, vector_bytes);

	// Convert rows of RGB to luma
	for (i = 0; i < image_height; i++) {
		// Transfer the next input row to scratchpad while processing
		if ((i+1) < image_height)
			vbx_dma_to_vector(v_row_in_next, rgb + (i+1)*image_pitch, vector_bytes);

		// Move weighted B into v_luma
		vbx(SVWHU, VAND, v_temp,   0xFF, v_row_in);
		vbx(SVHU,  VMUL, v_luma,     25, v_temp);

		// Move weighted G into v_temp and add it to v_luma
        vbx(SVWHU, VAND, v_temp,   0xFF, (vbx_uword_t*)(((vbx_ubyte_t *)v_row_in)+1));
		vbx(SVHU,  VMUL, v_temp,    129, v_temp);
		vbx(VVHU,  VADD, v_luma, v_luma, v_temp);

		// Move weighted R into v_temp and add it to v_luma
        vbx(SVWHU, VAND, v_temp,   0xFF, (vbx_uword_t*)(((vbx_ubyte_t *)v_row_in)+2));
		vbx(SVHU,  VMUL, v_temp,     66, v_temp);
		vbx(VVHU,  VADD, v_luma, v_luma, v_temp);

		// Round and normalize
		vbx(SVHU,  VADD, v_luma,  128, v_luma);
		vbx(SVHBU, VSHR, v_row_out, 8, v_luma);

		// Transfer from scratchpad memory to output
		vbx_dma_to_host(luma + i*image_pitch, v_row_out, vector_bytes>>2);

		// Swap scratchpad input buffer pointers
		tmp_ptr       = v_row_in;
		v_row_in      = v_row_in_next;
		v_row_in_next = tmp_ptr;
	}

	vbx_sp_pop();
	return VBW_SUCCESS;
}
