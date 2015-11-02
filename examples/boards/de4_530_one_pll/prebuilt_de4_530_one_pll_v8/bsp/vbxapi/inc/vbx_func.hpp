//VBXCOPYRIGHTTAG
#ifndef VBX_FUNC_HPP
#define VBX_FUNC_HPP

namespace VBX{
	namespace _internal{
		template<mask_choice is_mask,acc_choice is_acc,int dim >
		struct vbx_func;
		//1D
		template<int dim>
		struct vbx_func<IS_MASK,IS_ACC,dim>{
			static const dimensions_match<1,dim> _;
			template <typename T,typename U,typename V>
			static void func(vinstr_t vinstr,T dest,U srcA,V srcB){
				vbxx_masked_acc(vinstr,dest,srcA,srcB);
			}
			template <typename T,typename U>
			static void func(vinstr_t vinstr,T dest,U srcA){
				vbxx_masked_acc(vinstr,dest,srcA);
			}
		};
		template<int dim>
		struct vbx_func<IS_MASK,NO_ACC,dim>{
			static const dimensions_match<1,dim> _;
			template <typename T,typename U,typename V>
			static void func(vinstr_t vinstr,T dest,U srcA,V srcB){
				vbxx_masked(vinstr,dest,srcA,srcB);
			}
			template <typename T,typename U>
			static void func(vinstr_t vinstr,T dest,U srcA){
				vbxx_masked(vinstr,dest,srcA);
			}
		};
		template<int dim>
		struct vbx_func<NO_MASK,IS_ACC,dim>{
			static const dimensions_match<1,dim> _;
			template <typename T,typename U,typename V>
			static void func(vinstr_t vinstr,T dest,U srcA,V srcB){
				vbxx_acc(vinstr,dest,srcA,srcB);
			}
			template <typename T,typename U>
			static void func(vinstr_t vinstr,T dest,U srcA){
				vbxx_acc(vinstr,dest,srcA);
			}
		};
		template<int dim >
		struct vbx_func<NO_MASK,NO_ACC,dim>{
			static const dimensions_match<1,dim> _;
			template <typename T,typename U,typename V>
			static void func(vinstr_t vinstr,T dest,U srcA,V srcB){
				vbxx(vinstr,dest,srcA,srcB);
			}
			template <typename T,typename U>
			static void func(vinstr_t vinstr,T dest,U srcA){
				vbxx(vinstr,dest,srcA);
			}
		};
		//2D
		template<>
		struct vbx_func<IS_MASK,NO_ACC,2>{
			template <typename T,typename U,typename V>
			static void func(vinstr_t vinstr,T dest,U srcA,V srcB){
				assert("Masked 2D operations not permitted"&&0);
			}
			template <typename T,typename U>
			static void func(vinstr_t vinstr,T dest,U srcA){
				assert("Masked 2D operations not permitted"&&0);
			}
		};
		template<>
		struct vbx_func<IS_MASK,IS_ACC,2>{
			template <typename T,typename U,typename V>
			static void func(vinstr_t vinstr,T dest,U srcA,V srcB){
				assert("Masked 2D operations not permitted"&&0);
			}
			template <typename T,typename U>
			static void func(vinstr_t vinstr,T dest,U srcA){
				assert("Masked 2D operations not permitted"&&0);
			}
		};

		template<>
		struct vbx_func<NO_MASK,IS_ACC,2>{
			template <typename T,typename U,typename V>
			static void func(vinstr_t vinstr,T dest,U srcA,V srcB){
				vbxx_acc_2D(vinstr,dest,srcA,srcB);
			}
			template <typename T,typename U>
			static void func(vinstr_t vinstr,T dest,U srcA){
				vbxx_acc_2D(vinstr,dest,srcA);
			}
		};
		template<>
		struct vbx_func<NO_MASK,NO_ACC,2>{
			template <typename T,typename U,typename V>
			static void func(vinstr_t vinstr,T dest,U srcA,V srcB){
				vbxx_2D(vinstr,dest,srcA,srcB);
			}
			template <typename T,typename U>
			static void func(vinstr_t vinstr,T dest,U srcA){
				vbxx_2D(vinstr,dest,srcA);
			}
		};
		//3D
		template<>
		struct vbx_func<IS_MASK,NO_ACC,3>{
			template <typename T,typename U,typename V>
			static void func(vinstr_t vinstr,T dest,U srcA,V srcB){
				assert("Masked 3D operations not permitted"&&0);
			}
			template <typename T,typename U>
			static void func(vinstr_t vinstr,T dest,U srcA){
				assert("Masked 3D operations not permitted"&&0);
			}
		};
		template<>
		struct vbx_func<IS_MASK,IS_ACC,3>{
			template <typename T,typename U,typename V>
			static void func(vinstr_t vinstr,T dest,U srcA,V srcB){
				assert("Masked 3D operations not permitted"&&0);
			}
			template <typename T,typename U>
			static void func(vinstr_t vinstr,T dest,U srcA){
				assert("Masked 3D operations not permitted"&&0);
			}
		};

		template<>
		struct vbx_func<NO_MASK,IS_ACC,3>{
			template <typename T,typename U,typename V>
			static void func(vinstr_t vinstr,T dest,U srcA,V srcB){
				vbxx_acc_3D(vinstr,dest,srcA,srcB);
			}
			template <typename T,typename U>
			static void func(vinstr_t vinstr,T dest,U srcA){
				vbxx_acc_3D(vinstr,dest,srcA);
			}
		};
		template<>
		struct vbx_func<NO_MASK,NO_ACC,3>{
			template <typename T,typename U,typename V>
			static void func(vinstr_t vinstr,T dest,U srcA,V srcB){
				vbxx_3D(vinstr,dest,srcA,srcB);
			}
			template <typename T,typename U>
			static void func(vinstr_t vinstr,T dest,U srcA){
				vbxx_3D(vinstr,dest,srcA);
			}
		};


	}//namespace _internal
}//namespace VBX



#endif //VBX_FUNC_HPP
