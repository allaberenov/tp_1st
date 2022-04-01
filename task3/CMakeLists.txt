cmake_minimum_required(VERSION 3.0)

if(${ARM_BUILD})
	set(CMAKE_SYSTEM_NAME "Linux")
#	set(CMAKE_SYSTEM_PROCESS "arm")
	set(CMAKE_C_COMPILER ${TOOLCHAIN}/aarch64-linux-gnu-gcc)
	set(CMAKE_CXX_COMPILER ${TOOLCHAIN}/aarch64-linux-gnu-g++)
	set(CMAKE_FIND_ROOT_PATH ${TOOLCHAIN}/aarch64-linux-gnu-g++)
#	add_definitions("-Wall -g")
	message("Компилятор aarch64 установлен\n")
endif()
project(SimpleLibrary)
include_directories(include)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${SimpleLibrary_SOURCE_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${SimpleLibrary_SOURCE_DIR}/lib)
add_subdirectory(src)
add_executable(Main main.cpp)
add_executable(MainLib main_lib.cpp)
#set_target_properties(MainLib PROPERTIES INSTALL_RPATH ${CMAKE_INSTALL_PREFIX} ))

set_target_properties(MainLib PROPERTIES 
	INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}"
	BUILD_WITH_INSTALL_RPATH 1
)

install(TARGETS MainLib DESTINATION ${CMAKE_INSTALL_PREFIX/bin})

target_link_libraries(MainLib buffer)
message("Линковка прошла успешно")
message("${TARGET_LINKLIBRARIES_NAME}")
install(DIRECTORY ${SimpleLibrary_SOURCE_DIR}/include DESTINATION ${CMAKE_INSTALL_PREFIX})
message("Установка прошла успешно")
