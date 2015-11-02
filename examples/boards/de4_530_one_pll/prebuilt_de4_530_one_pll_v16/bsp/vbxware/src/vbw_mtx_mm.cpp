//VBXCOPYRIGHTTAG
/**@file*/
#include "vbw_mtx_mm.h"
extern "C"{
	int vbw_mtx_mul_scalar_ext_word( vbx_word_t *out, vbx_word_t *in1, const int IN1ROWS, const int IN1COLS,
	                                 vbx_word_t *in2pre, const int IN2ROWS, const int IN2COLS )
	{return vbw_mtx_mul_scalar_ext( out, in1,IN1ROWS,IN1COLS,in2pre,IN2ROWS,IN2COLS );}
	int vbw_mtx_mul_scalar_ext_uword( vbx_uword_t *out, vbx_uword_t *in1, const int IN1ROWS, const int IN1COLS,
	                                  vbx_uword_t *in2pre, const int IN2ROWS, const int IN2COLS )
	{return vbw_mtx_mul_scalar_ext( out, in1,IN1ROWS,IN1COLS,in2pre,IN2ROWS,IN2COLS );}
	int vbw_mtx_mul_scalar_ext_half( vbx_half_t *out, vbx_half_t *in1, const int IN1ROWS, const int IN1COLS,
	                                 vbx_half_t *in2pre, const int IN2ROWS, const int IN2COLS )
	{return vbw_mtx_mul_scalar_ext( out, in1,IN1ROWS,IN1COLS,in2pre,IN2ROWS,IN2COLS );}
	int vbw_mtx_mul_scalar_ext_uhalf( vbx_uhalf_t *out, vbx_uhalf_t *in1, const int IN1ROWS, const int IN1COLS,
	                                  vbx_uhalf_t *in2pre, const int IN2ROWS, const int IN2COLS )
	{return vbw_mtx_mul_scalar_ext( out, in1,IN1ROWS,IN1COLS,in2pre,IN2ROWS,IN2COLS );}
	int vbw_mtx_mul_scalar_ext_byte( vbx_byte_t *out, vbx_byte_t *in1, const int IN1ROWS, const int IN1COLS,
	                                 vbx_byte_t *in2pre, const int IN2ROWS, const int IN2COLS )
	{return vbw_mtx_mul_scalar_ext( out, in1,IN1ROWS,IN1COLS,in2pre,IN2ROWS,IN2COLS );}
	int vbw_mtx_mul_scalar_ext_ubyte( vbx_ubyte_t *out, vbx_ubyte_t *in1, const int IN1ROWS, const int IN1COLS,
	                                  vbx_ubyte_t *in2pre, const int IN2ROWS, const int IN2COLS )
	{return vbw_mtx_mul_scalar_ext( out, in1,IN1ROWS,IN1COLS,in2pre,IN2ROWS,IN2COLS );}


	int vbw_mtx_mm_trans_ext_word( vbx_word_t *out, vbx_word_t *in1,const int IN1ROWS, const int IN1COLS,
	                          vbx_word_t *in2pre, const int IN2ROWS, const int IN2COLS )
	{return vbw_mtx_mm_trans_ext<vbx_word_t>( out, in1,IN1ROWS,IN1COLS,in2pre,IN2ROWS,IN2COLS);}
	int vbw_mtx_mm_trans_ext_uword( vbx_uword_t *out, vbx_uword_t *in1,const int IN1ROWS, const int IN1COLS,
	                           vbx_uword_t *in2pre, const int IN2ROWS, const int IN2COLS )
	{return vbw_mtx_mm_trans_ext<vbx_uword_t>( out, in1, IN1ROWS,IN1COLS,in2pre,IN2ROWS,IN2COLS);}
	int vbw_mtx_mm_trans_ext_half( vbx_half_t *out, vbx_half_t *in1,const int IN1ROWS, const int IN1COLS,
	                          vbx_half_t *in2pre, const int IN2ROWS, const int IN2COLS )
	{return vbw_mtx_mm_trans_ext<vbx_half_t>( out, in1,IN1ROWS,IN1COLS,in2pre,IN2ROWS,IN2COLS);}
	int vbw_mtx_mm_trans_ext_uhalf( vbx_uhalf_t *out, vbx_uhalf_t *in1,const int IN1ROWS, const int IN1COLS,
	                           vbx_uhalf_t *in2pre, const int IN2ROWS, const int IN2COLS )
	{return vbw_mtx_mm_trans_ext<vbx_uhalf_t>( out, in1,IN1ROWS,IN1COLS,in2pre,IN2ROWS,IN2COLS);}
	int vbw_mtx_mm_trans_ext_byte( vbx_byte_t *out, vbx_byte_t *in1,const int IN1ROWS, const int IN1COLS,
	                          vbx_byte_t *in2pre, const int IN2ROWS, const int IN2COLS )
	{return vbw_mtx_mm_trans_ext<vbx_byte_t>( out, in1,IN1ROWS,IN1COLS,in2pre,IN2ROWS,IN2COLS);}
	int vbw_mtx_mm_trans_ext_ubyte( vbx_ubyte_t *out, vbx_ubyte_t *in1,const int IN1ROWS, const int IN1COLS,
	                           vbx_ubyte_t *in2pre, const int IN2ROWS, const int IN2COLS )
	{return vbw_mtx_mm_trans_ext<vbx_ubyte_t>( out, in1,IN1ROWS,IN1COLS,in2pre,IN2ROWS,IN2COLS);}

	int vbw_mtx_mm_ext_word( vbx_word_t *out, vbx_word_t *in1, const int rows1, const int cols1,
	                         vbx_word_t *in2, const int rows2, const int cols2 ){
		return vbw_mtx_mm_ext<vbx_word_t>(out,in1,rows1,cols1,in2,rows2,cols2) ;
	}
	int vbw_mtx_mm_ext_uword( vbx_uword_t *out, vbx_uword_t *in1, const int rows1, const int cols1,
	                          vbx_uword_t *in2, const int rows2, const int cols2 ){
		return vbw_mtx_mm_ext<vbx_uword_t>(out,in1,rows1,cols1,in2,rows2,cols2) ;
	}
	int vbw_mtx_mm_ext_half( vbx_half_t *out, vbx_half_t *in1, const int rows1, const int cols1,
	                         vbx_half_t *in2, const int rows2, const int cols2 ){
		return vbw_mtx_mm_ext<vbx_half_t>(out,in1,rows1,cols1,in2,rows2,cols2) ;
	}
	int vbw_mtx_mm_ext_uhalf( vbx_uhalf_t *out, vbx_uhalf_t *in1, const int rows1, const int cols1,
	                          vbx_uhalf_t *in2, const int rows2, const int cols2 ){
		return vbw_mtx_mm_ext<vbx_uhalf_t>(out,in1,rows1,cols1,in2,rows2,cols2) ;
	}
	int vbw_mtx_mm_ext_byte( vbx_byte_t *out, vbx_byte_t *in1, const int rows1, const int cols1,
	                         vbx_byte_t *in2, const int rows2, const int cols2 ){
		return vbw_mtx_mm_ext<vbx_byte_t>(out,in1,rows1,cols1,in2,rows2,cols2) ;
	}
	int vbw_mtx_mm_ext_ubyte( vbx_ubyte_t *out, vbx_ubyte_t *in1, const int rows1, const int cols1,
	                          vbx_ubyte_t *in2, const int rows2, const int cols2 ){
		return vbw_mtx_mm_ext<vbx_ubyte_t>(out,in1,rows1,cols1,in2,rows2,cols2) ;
	}
}
