#ifndef VBX_CPROTO_TINY_H
#define VBX_CPROTO_TINY_H

#define vbx(VMODE,VINSTR,DEST,SRCA,SRCB)            vbxasm(VMODE,VINSTR,DEST,SRCA,SRCB)
#define vbx_masked(VMODE,VINSTR,DEST,SRCA,SRCB)     vbxasm_masked(VMODE,VINSTR,DEST,SRCA,SRCB)
#define vbx_acc(VMODE,VINSTR,DEST,SRCA,SRCB)        vbxasm_acc(VMODE,VINSTR,DEST,SRCA,SRCB)
#define vbx_masked_acc(VMODE,VINSTR,DEST,SRCA,SRCB) vbxasm_masked_acc(VMODE,VINSTR,DEST,SRCA,SRCB)
#define vbx_2D(VMODE,VINSTR,DEST,SRCA,SRCB)         vbxasm_2D(VMODE,VINSTR,DEST,SRCA,SRCB)
#define vbx_acc_2D(VMODE,VINSTR,DEST,SRCA,SRCB)     vbxasm_acc_2D(VMODE,VINSTR,DEST,SRCA,SRCB)
#define vbx_3D(VMODE,VINSTR,DEST,SRCA,SRCB)         vbxasm_3D(VMODE,VINSTR,DEST,SRCA,SRCB)
#define vbx_acc_3D(VMODE,VINSTR,DEST,SRCA,SRCB)     vbxasm_acc_3D(VMODE,VINSTR,DEST,SRCA,SRCB)


#define vbx_setup_mask(VINSTR,SRC)\
	do{ \
	typedef typeof(*(SRC)) src_t;\
	int is_signed=((src_t)-1 <0);\
	if( is_signed && sizeof(src_t)==sizeof(vbx_word_t)) /*signed word*/ \
		vbxasm_setup_mask(SVWS,VINSTR,(vbx_word_t*)SRC); \
	if( is_signed && sizeof(src_t)==sizeof(vbx_half_t)) /*signed half*/ \
		vbxasm_setup_mask(SVHS,VINSTR,(vbx_half_t*)SRC); \
	if( is_signed && sizeof(src_t)==sizeof(vbx_byte_t)) /*signed byte*/ \
		vbxasm_setup_mask(SVBS,VINSTR,(vbx_byte_t*)SRC); \
	if( !is_signed && sizeof(src_t)==sizeof(vbx_word_t)) /*unsigned word*/ \
		vbxasm_setup_mask(SVWU,VINSTR,(vbx_uword_t*)SRC); \
	if( !is_signed && sizeof(src_t)==sizeof(vbx_half_t)) /*unsigned half*/ \
		vbxasm_setup_mask(SVHU,VINSTR,(vbx_uhalf_t*)SRC); \
	if( !is_signed && sizeof(src_t)==sizeof(vbx_byte_t)) /*unsigned byte*/ \
		vbxasm_setup_mask(SVBU,VINSTR,(vbx_ubyte_t*)SRC); \
	}while(0)

#define vbx_setup_mask_masked(VINSTR,SRC)\
	do{ \
	typedef typeof(*(SRC)) src_t;\
	int is_signed=((src_t)-1 <0);\
	if( is_signed && sizeof(src_t)==sizeof(vbx_word_t)) /*signed word*/ \
		vbxasm_setup_mask_masked(SVWS,VINSTR,(vbx_word_t*)SRC); \
	if( is_signed && sizeof(src_t)==sizeof(vbx_half_t)) /*signed half*/ \
		vbxasm_setup_mask_masked(SVHS,VINSTR,(vbx_half_t*)SRC); \
	if( is_signed && sizeof(src_t)==sizeof(vbx_byte_t)) /*signed byte*/ \
		vbxasm_setup_mask_masked(SVBS,VINSTR,(vbx_byte_t*)SRC); \
	if( !is_signed && sizeof(src_t)==sizeof(vbx_word_t)) /*unsigned word*/ \
		vbxasm_setup_mask_masked(SVWU,VINSTR,(vbx_uword_t*)SRC); \
	if( !is_signed && sizeof(src_t)==sizeof(vbx_half_t)) /*unsigned half*/ \
		vbxasm_setup_mask_masked(SVHU,VINSTR,(vbx_uhalf_t*)SRC); \
	if( !is_signed && sizeof(src_t)==sizeof(vbx_byte_t)) /*unsigned byte*/ \
		vbxasm_setup_mask_masked(SVBU,VINSTR,(vbx_ubyte_t*)SRC); \
	}while(0)

#endif //VBX_CPROTO_TINY_H
