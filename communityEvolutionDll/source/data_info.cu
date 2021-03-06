#include "../stdafx.h"
#include "../include/data_info.h"

pair_t get_device_memory(){
	U32 f, t;
	cudaSetDevice(0);
	cudaFree(0); 
	cudaMemGetInfo(&f, &t);
	return pair_t(f, t);
}

void display_device_memory(){
	pair_t dev_mem = get_device_memory();

	std::locale loc("");
	std::cout.imbue(loc);
	std::cout << "free memory: " << dev_mem.first / 1024 << " "
		<< "total memory: " << dev_mem.second / 1024 << std::endl;
}

