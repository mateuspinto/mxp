//VBXCOPYRIGHTTAG
#ifndef MASKED_VECTOR_HPP
#define MASKED_VECTOR_HPP

#include "Vector.hpp"
template<typename T,typename U,vinstr_t vinstr,typename btype>
inline void Vector_mask_narrow(const VBX::_internal::bin_op<T,U,vinstr,btype,1>& msk)
{

	VBX::Vector<btype> cmp(get_length(msk));
	cmp = msk;
	vbx_setup_mask_masked(cmp.cmv,cmp.data);
}
template<typename T>
inline void Vector_mask_narrow(const VBX::Vector<T>& msk)
{

	vbx_setup_mask_masked(msk.cmv,msk.data);
}
template<bool is_all_and>
struct log_op_mask_narrow;
template<>struct log_op_mask_narrow<true>
{
	template<typename lhs_t,typename rhs_t,VBX::_internal::log_op_t lop,bool negate>
	static void fun(const VBX::_internal::Logical_vop<lhs_t,rhs_t,lop,negate>& msk)
	{
		Vector_mask_narrow(msk.lhs);
		Vector_mask_narrow(msk.rhs);
	}
};
template<>struct log_op_mask_narrow<false>
{
	template<typename lhs_t,typename rhs_t,VBX::_internal::log_op_t lop,bool negate>
	static void fun(const VBX::_internal::Logical_vop<lhs_t,rhs_t,lop,negate>& msk)
	{
		VBX::Vector<char> cmp(get_length(msk));
		cmp=msk;
		vbx_setup_mask_masked(cmp.cmv,cmp.data);
	}
};

template<typename lhs_t,typename rhs_t,VBX::_internal::log_op_t lop,bool negate>
inline void Vector_mask_narrow(const VBX::_internal::Logical_vop<lhs_t,rhs_t,lop,negate>& msk)
{
	//since all of logical operators are &&, we can progressively narrow the mask
	log_op_mask_narrow<
		VBX::_internal::is_all_and<VBX::_internal::Logical_vop<lhs_t,rhs_t,lop,negate> >::result>::fun(msk);
}
#define Vector_mask( comp ) for( vector_mask_obj v((comp)); !v.done_flag;v.done_flag=true)
#define Vector_mask_loop( comp,while_cond ) for( vector_mask_obj v((comp)); (Vector_mask_narrow(comp),while_cond);)

//usage :
// Vector_mask( a<b,len){
//  ...
//  masked calculations
//  ...
// }

template<typename T>
inline void vector_mask_obj::constructor(const VBX::Vector<T>& msk){
	vbx_setup_mask(msk.cmv,msk.data);
	vector_mask_obj::nested++;
	done_flag=false;
}
template<typename lhs_t,typename rhs_t,vinstr_t vinstr,typename btype>
inline void vector_mask_obj::constructor(const VBX::_internal::bin_op<lhs_t,rhs_t,vinstr,btype,1>& msk)
{
	VBX::Vector<btype> cmp(get_length(msk));
	cmp = msk;
	constructor(cmp);
}

template<typename T,typename U,vinstr_t vinstr,typename btype>
inline vector_mask_obj::vector_mask_obj(const VBX::_internal::bin_op<T,U,vinstr,btype,1>& msk)
{
	constructor(msk);
}
template<typename T>
inline vector_mask_obj::vector_mask_obj(const VBX::Vector<T>& msk)
{
	vbx_set_vl(msk.size);
	constructor(msk);
}

template<typename lhs_t,typename rhs_t,VBX::_internal::log_op_t lop,bool negate>
inline void vector_mask_obj::constructor(const VBX::_internal::Logical_vop<lhs_t,rhs_t,lop,negate>& msk)
{
	if(VBX::_internal::is_all_and<VBX::_internal::Logical_vop<lhs_t,rhs_t,lop,negate> >::result){
		constructor(msk.lhs);
		Vector_mask_narrow(msk.rhs);
	}else{
		VBX::Vector<vbx_byte_t> cmp(get_length(msk));
		cmp=msk;
		constructor(cmp);
	}
}

template<typename lhs_t,typename rhs_t,VBX::_internal::log_op_t lop,bool negate>
inline vector_mask_obj::vector_mask_obj(const VBX::_internal::Logical_vop<lhs_t,rhs_t,
                                                              lop,negate>& msk)
{
	constructor(msk);
}
//destructor, run at the end of the masked block
inline vector_mask_obj::~vector_mask_obj()
{
	nested--;
}



#endif //MASKED_VECTOR_HPP
