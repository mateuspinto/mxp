//VBXCOPYRIGHTTAG
/**
 * @file vbw_mtx_motest.h
 * @defgroup Matrix_Motion_Estimation Matrix Motion Estimation
 * @brief Matrix Motion Estimation
 * @ingroup VBXware
 */
/**@{*/

#ifndef __VBX_MTX_MOTEST_H
#define __VBX_MTX_MOTEST_H

//
// Motion Estimation
// Scalar NIOS version and vbx VECTOR version
//

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#include "vbx.h"
#ifdef __cplusplus
extern "C"{
#endif
typedef unsigned char  input_type;
typedef unsigned short intermediate_type;
typedef unsigned int   output_type;

typedef struct {
int                image_width;
int                image_height;
int                block_width;
int                block_height;
int                search_width;
int                search_height;
int                result_size;
// 2D and 3D
input_type        *v_block;
input_type        *v_img;
intermediate_type *v_row_sad;
output_type       *v_result;
// 2D
input_type        *v_img_sub;
input_type        *v_absdiff;
} vbw_motest_t;


void vbw_mtx_motest_scalar_byte  (output_type *result, input_type *x, input_type *y, vbw_motest_t *m);

int  vbw_mtx_motest_byte         (output_type *result, input_type *x, input_type *y, vbw_motest_t *m);

int  vbw_mtx_motest_3d_byte      (output_type *result, input_type *x, input_type *y, vbw_motest_t *m);

int  vbw_mtx_motest_byte_setup   ( vbw_motest_t *m );

int  vbw_mtx_motest_3d_byte_setup( vbw_motest_t *m );
#ifdef __cplusplus
}
#endif
#endif // __VBX_MTX_MOTEST_H
/**@}*/
