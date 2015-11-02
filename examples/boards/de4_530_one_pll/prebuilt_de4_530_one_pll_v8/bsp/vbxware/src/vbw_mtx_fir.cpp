//VBXCOPYRIGHTTAG
/**@file*/
#include "vbx.h"
#include "vbw_exit_codes.h"
#include "vbw_template.hpp"

/** 2D FIR filter using vector processor.
 *
 * @param[out] output Pointer to start of output matrix
 * @param[in] input Pointer to start of input matrix
 * @param[in] coeffs Pointer to start of coefficient matrix
 * @param[in] num_row Number of rows in the input matrix
 * @param[in] num_column Number of columns in the input matrix
 * @param[in] ntaps_row Number of rows in the coefficient matrix
 * @param[in] ntaps_column Mumber of columns in the coefficient matrix
 */

template<typename vbx_mm_t>
void vbw_mtx_2Dfir(vbx_mm_t *output, vbx_mm_t *input, int32_t *coeffs, const int num_row, const int num_column, const int ntaps_row, const int ntaps_column )
{
	vbx_sp_push();

	int l,j,i,modj;
	typedef vbx_mm_t vbx_sp_t;
	vbx_sp_t *sample  = (vbx_sp_t*)vbx_sp_malloc( num_column*ntaps_row*sizeof(vbx_sp_t) );
	vbx_sp_t *accum   = (vbx_sp_t*)vbx_sp_malloc( num_column*sizeof(vbx_sp_t)    );
	typedef typename word_sized<vbx_mm_t>::type local_word_t;
	local_word_t *accum_int = (local_word_t *)vbx_sp_malloc( num_column*sizeof(vbx_word_t) );
	local_word_t *mult_int  = (local_word_t *)vbx_sp_malloc( num_column*sizeof(vbx_word_t) );

	vbx_set_vl(num_column);
	for( j = 0; j < ntaps_row; j++ ) {
		vbx_dma_to_vector( sample+(j*num_column), input+j*num_column, num_column*sizeof(vbx_sp_t) );
	}

	modj = 0;

	for( l = 0; l < num_row-ntaps_row; l++ ) {

		vbxx(VMULLO, accum_int, coeffs[0], sample+modj*num_column );

		for( i = 1; i < ntaps_column; i++ ) {
			vbxx( VMULLO, mult_int, coeffs[i], sample+modj*num_column+i );
			vbxx( VADD, accum_int, accum_int, mult_int );
		}
		modj++;
		if(modj == ntaps_row)modj = 0;

		for( j = 1; j < ntaps_row; j++ ) {
			for( i = 0; i < ntaps_column; i++ ) {
				vbxx(VMULLO,  mult_int, coeffs[j*ntaps_column+i], sample+modj*num_column+i );
				vbxx(VADD,   accum_int, accum_int, mult_int );
			}
			modj++;
			if( modj == ntaps_row ) modj = 0;
		}

		//vbx( VV(IT), VMOV, accum, ((vbx_sp_t *)accum_int)+1, 0);
		vbxx(VSHR, accum, 8, accum_int);

		vbx_dma_to_host( output+l*num_column, accum, (num_column-ntaps_column)*sizeof(vbx_sp_t) );
		if(l+1 < num_row-ntaps_row){
			vbx_dma_to_vector( sample+(modj*num_column), input+(l+ntaps_row)*num_column, num_column*sizeof(vbx_sp_t) );
		}
		modj++;
		if( modj == ntaps_row ) modj = 0;
	}

	vbx_sp_pop();
	vbx_sync();
}

extern "C" void vbw_mtx_2Dfir_word(vbx_word_t *output, vbx_word_t *input, int32_t *coeffs, const int num_row, const int num_column, const int ntaps_row, const int ntaps_column )
{vbw_mtx_2Dfir<vbx_word_t>(output,input,coeffs,num_row,num_column,ntaps_row,ntaps_column);}
extern "C" void vbw_mtx_2Dfir_uword(vbx_uword_t *output, vbx_uword_t *input, int32_t *coeffs, const int num_row, const int num_column, const int ntaps_row, const int ntaps_column )
{vbw_mtx_2Dfir<vbx_uword_t>(output,input,coeffs,num_row,num_column,ntaps_row,ntaps_column);}
extern "C" void vbw_mtx_2Dfir_half(vbx_half_t *output, vbx_half_t *input, int32_t *coeffs, const int num_row, const int num_column, const int ntaps_row, const int ntaps_column )
{vbw_mtx_2Dfir<vbx_half_t>(output,input,coeffs,num_row,num_column,ntaps_row,ntaps_column);}
extern "C" void vbw_mtx_2Dfir_uhalf(vbx_uhalf_t *output, vbx_uhalf_t *input, int32_t *coeffs, const int num_row, const int num_column, const int ntaps_row, const int ntaps_column )
{vbw_mtx_2Dfir<vbx_uhalf_t>(output,input,coeffs,num_row,num_column,ntaps_row,ntaps_column);}
extern "C" void vbw_mtx_2Dfir_byte(vbx_byte_t *output, vbx_byte_t *input, int32_t *coeffs, const int num_row, const int num_column, const int ntaps_row, const int ntaps_column )
{vbw_mtx_2Dfir<vbx_byte_t>(output,input,coeffs,num_row,num_column,ntaps_row,ntaps_column);}
extern "C" void vbw_mtx_2Dfir_ubyte(vbx_ubyte_t *output, vbx_ubyte_t *input, int32_t *coeffs, const int num_row, const int num_column, const int ntaps_row, const int ntaps_column )
{vbw_mtx_2Dfir<vbx_ubyte_t>(output,input,coeffs,num_row,num_column,ntaps_row,ntaps_column);}
