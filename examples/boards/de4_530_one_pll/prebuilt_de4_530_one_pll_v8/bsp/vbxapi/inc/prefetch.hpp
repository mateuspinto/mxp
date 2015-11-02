//VBXCOPYRIGHTTAG
#ifndef PREFETCH_HPP
#define PREFETCH_HPP
#include "Vector.hpp"
namespace VBX{
	template<typename T>
	class Prefetcher{
		Vector<T>** vecs;
		int num_vecs;
		int current_vec;
		int chunk_size;
		int chunk_increment;
		bool full;
		T* current_in;
		T* last_in;
	public:
		Prefetcher(int num,size_t chunk_size,T* first_in,T* last_in,ssize_t chunk_increment=0)
			:num_vecs(num+1),
			 current_vec(0),
			 chunk_size(chunk_size),
			 chunk_increment(chunk_increment?chunk_increment:chunk_size),
			 full(false),
			 current_in(first_in),
			 last_in(last_in)
		{
			vecs = (Vector<T>**)malloc(sizeof(Vector<T>*)*num_vecs);
			for(int i=0;i<num_vecs;i++){
				vecs[i]=new Vector<T>(chunk_size);
			}
		}
		//rotate the fifo without a dma, useful for last
		//buffer
		void rotate()
		{
			if (++current_vec >=num_vecs){
				full=1;
				current_vec=0;
			}
		}

		void fetch()
		{
			if(current_in <last_in){
				if( current_in + chunk_size > last_in){
					vecs[current_vec]->size=(T*)last_in-(T*)current_in;
				}
				vecs[current_vec]->dma_read(current_in);
				current_in+=chunk_increment;
			}
			rotate();
		}

		Vector<T>& operator[](int nth_vector)
		{
			int actual_vector=nth_vector;
			if( full){
				actual_vector+= current_vec  ;
			}
			/*assume this loop is faster than a modulus operation*/
			/*only true if nth_vector is not too much larger than num_vecs*/
			while(actual_vector >= num_vecs){
				actual_vector -= num_vecs;
			}
			return *vecs[actual_vector];
		}
		~Prefetcher()
		{

			while(num_vecs){
				delete vecs[--num_vecs];
			}
			free(vecs);
		}
	};
}
#endif //PREFETCH_HPP
