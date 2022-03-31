cmake_minimum_required(VERSION 3.0)


if(${ARM_BUILD})
	set(CMAKE_SYSTEM_NAME "Linux")
#	set(CMAKE_SYSTEM_PROCESS "arm")
	#set(CMAKE_C_COMPILER ${TOOLCHAIN}/aarch64-linux-gnu-gcc)
	set(CMAKE_CXX_COMPILER ${TOOLCHAIN}/aarch64-linux-gnu-g++)
#	add_definitions("-Wall -g")
	message("Компилятор установлен\n")
endif()
project(SimpleLibrary)


include_directories(include)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${SimpleLibrary_SOURCE_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${SimpleLibrary_SOURCE_DIR}/lib)
add_subdirectory(src)
add_executable(Main main.cpp)
add_executable(MainLib main_lib.cpp)

target_link_libraries(MainLib buffer)


install(TARGETS Main DESTINATION build)
install(TARGETS MainLib buffer DESTINATION build)
