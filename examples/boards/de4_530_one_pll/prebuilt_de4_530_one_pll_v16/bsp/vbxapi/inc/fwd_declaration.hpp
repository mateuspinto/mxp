//VBXCOPYRIGHTTAG
#ifndef FWD_DECLARATION_HPP
#define FWD_DECLARATION_HPP
namespace VBX{

	template<typename T,int Dim=1>
	class Vector;
	class enum_t;

	enum mask_choice{IS_MASK=1,NO_MASK=0};
	enum acc_choice{IS_ACC=1,NO_ACC=0};

	namespace _internal{

		template<typename T,typename U,vinstr_t instr,typename btype,int Dim,acc_choice acc=NO_ACC>
		struct bin_op;

		template<typename T>
		struct accum_op;

		template<typename dest_t,mask_choice is_masked,int dim>
		struct assignment;

		template<typename dest_t,mask_choice is_masked>
		struct resolve;

		template<typename dest_t,mask_choice is_masked>
		struct conditional_move;

		template<mask_choice is_mask,acc_choice is_acc,int dim=1 >
		struct vbx_func;

		enum log_op_t{
			LOGICAL_OR,LOGICAL_AND,NONE
		};
		template<typename lhs_t,typename rhs_t,log_op_t lop,bool negate=false>
		struct Logical_vop;

		template<typename T>
		struct is_all_and;

	}
}
template <typename D,typename B>
struct source_resolve;

#endif //FWD_DECLARATION_HPP
