cmake_minimum_required(VERSION 3.19)
project(C)
##########################################################################################################################


if (POLICY CMP0048)
    cmake_policy(SET CMP0048 NEW)
endif (POLICY CMP0048)

if (POLICY CMP0077)
    cmake_policy(SET CMP0077 NEW)
endif (POLICY CMP0077)

set(GOOGLETEST_VERSION 1.11.0)

if(NOT CYGWIN AND NOT MSYS AND NOT ${CMAKE_SYSTEM_NAME} STREQUAL QNX)
    set(CMAKE_CXX_EXTENSIONS OFF)
endif()


#Note that googlemock target already builds googletest
option(BUILD_GMOCK "Builds the googlemock subproject" ON)
option(INSTALL_GTEST "Enable installation of googletest. (Projects embedding googletest may want to turn this OFF.)" ON)

enable_testing()

ADD_SUBDIRECTORY (C/googletest)
include_directories(${gtest_SOURCE_DIR}/include ${CMAKE_SOURCE_DIR})
find_package(PythonInterp REQUIRED)
add_custom_command(
  OUTPUT index.h 
  COMMAND ${PYTHON_EXECUTABLE} ${C_SOURCE_DIR}/A/preparing.py ${C_SOURCE_DIR}
  DEPENDS A/preparing.py
  COMMENT "Генерация файла index.h"
)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${C_SOURCE_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${C_SOURCE_DIR}/lib)

add_custom_target(RunGenerator DEPENDS index.h )
add_executable(${PROJECT_NAME} C/main.cpp)
add_dependencies(${PROJECT_NAME}  RunGenerator)
target_include_directories(${PROJECT_NAME}  PRIVATE ${MY_DIR})

add_subdirectory(B)
target_link_libraries(${PROJECT_NAME}  lib)
target_include_directories(${PROJECT_NAME}  PRIVATE ${PROJECT_SOURCE_DIR} ${PROJECT_BINARY_DIR})




################################
# Unit Tests
################################
# Add test cpp file
add_executable( CTest C/main_test.cpp )
# Link test executable against gtest & gtest_main
target_link_libraries(CTest gtest gtest_main)
add_test( CTest CTest )

