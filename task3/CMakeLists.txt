cmake_minimum_required(VERSION 3.0)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${SimpleLibrary_SOURCE_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${SimpleLibrary_SOURCE_DIR}/lib)

project(SimpleLibrary)

if(${ARM_BUILD})
	set(CMAKE_SYSTEM_NAME "Linux")
#	set(CMAKE_SYSTEM_PROCESS "arm")
	set(CMAKE_C_COMPILER ${TOOLCHAIN}/aarch64-linux-gnu-gcc)
	set(CMAKE_CXX_COMPILER ${TOOLCHAIN}/aarch64-linux-gnu-g++)
	set(CMAKE_FIND_ROOT_PATH ${TOOLCHAIN}/aarch64-linux-gnu-g++)
#	add_definitions("-Wall -g")
	message("Компилятор aarch64 установлен\n")
endif()

set(BOOST_ROOT "/home/.../boost")
find_package(Boost COMPONENTS filesystem system REQUIRED)

include_directories(include)
include_directories(${Boost_INCLUDE_DIRS})
add_executable(Main main.cpp)
add_executable(MainLib main_lib.cpp)

add_subdirectory(src)

link_directories(${Boost_LIBRARY_DIRS})
target_link_libraries(MainLib buffer)
	

#set_target_properties(MainLib PROPERTIES INSTALL_RPATH ${CMAKE_INSTALL_PREFIX} ))
message("Линковка прошла успешно")
message("${TARGET_LINKLIBRARIES_NAME}")
install(DIRECTORY ${SimpleLibrary_SOURCE_DIR}/include DESTINATION ${CMAKE_INSTALL_PREFIX})

install(
    TARGETS MainLib
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
)
message("Установка прошла успешно")

