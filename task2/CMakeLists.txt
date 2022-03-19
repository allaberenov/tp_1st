cmake_minimum_required(VERSION 3.19)
project(MyProject)

if (POLICY CMP0048)
    cmake_policy(SET CMP0048 NEW)
endif (POLICY CMP0048)

if (POLICY CMP0077)
    cmake_policy(SET CMP0077 NEW)
endif (POLICY CMP0077)

project(googletest-distribution)
set(GOOGLETEST_VERSION 1.11.0)

if(NOT CYGWIN AND NOT MSYS AND NOT ${CMAKE_SYSTEM_NAME} STREQUAL QNX)
    set(CMAKE_CXX_EXTENSIONS OFF)
endif()


#Note that googlemock target already builds googletest
option(BUILD_GMOCK "Builds the googlemock subproject" ON)
option(INSTALL_GTEST "Enable installation of googletest. (Projects embedding googletest may want to turn this OFF.)" ON)

enable_testing()

ADD_SUBDIRECTORY (C/googletest)
enable_testing()
include_directories(${gtest_SOURCE_DIR}/include ${gtest_SOURCE_DIR})

################################
# Unit Tests
################################
# Add test cpp file
add_executable( runUnitTests C/main_test.cpp )
# Link test executable against gtest & gtest_main
target_link_libraries(runUnitTests gtest gtest_main)
add_test( runUnitTests runUnitTests )



find_package(PythonInterp REQUIRED)
add_custom_command(
  OUTPUT index.h 
  COMMAND ${PYTHON_EXECUTABLE} ${MyProject_SOURCE_DIR}/A/preparing.py ${MyProject_SOURCE_DIR}
  DEPENDS A/preparing.py
  COMMENT "Генерация файла index.h"
)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${MyProject_SOURCE_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${MyProject_SOURCE_DIR}/lib)

add_custom_target(RunGenerator DEPENDS index.h COMMENT "Checking if re-generation is required")

add_executable(MyProject C/main.cpp)

add_dependencies(MyProject RunGenerator)

add_subdirectory(B)
target_link_libraries(MyProject lib)
target_include_directories(MyProject PRIVATE ${PROJECT_SOURCE_DIR} ${PROJECT_BINARY_DIR})

