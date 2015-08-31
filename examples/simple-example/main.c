#include <stdio.h>
#include "vbx.h"


const int num_elements=10;
int main() {
	int i;

#if VBX_SIMULATOR==1
	//initialize with 4 lanes,and 64kb of sp memory
	//word,half,byte fraction bits 16,15,4 respectively
	vbxsim_init(4,64,256,16,15,4);
#endif
	vbx_word_t* a=vbx_sp_malloc(num_elements*sizeof(vbx_word_t));
	vbx_word_t* b=vbx_sp_malloc(num_elements*sizeof(vbx_word_t));
	vbx_word_t* c=vbx_sp_malloc(num_elements*sizeof(vbx_word_t));
	vbx_set_vl(num_elements);
	//a = [1,2,3,...,10]
	vbx(SEW,VADD,a,1,0);
	//b = [4,4,....,4]
	vbx(SVW,VMOV,b,4,0);
	//c = a * b
	vbx(VVW,VMUL,c,a,b);
	//wait for all vector instructions to finish
	vbx_sync();
	//print out vector c
	for(i=0;i<num_elements;i++){
		printf("%d,",c[i]);
	}
	printf("\n");

	return 0;
}
