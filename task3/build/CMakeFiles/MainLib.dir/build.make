# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /snap/cmake/1070/bin/cmake

# The command to remove a file.
RM = /snap/cmake/1070/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/kerim/Documents/TechProgSimpleLibrary/TechProgSimpleLibrary

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kerim/Documents/TechProgSimpleLibrary/TechProgSimpleLibrary/build

# Include any dependencies generated for this target.
include CMakeFiles/MainLib.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/MainLib.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/MainLib.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/MainLib.dir/flags.make

CMakeFiles/MainLib.dir/main_lib.cpp.o: CMakeFiles/MainLib.dir/flags.make
CMakeFiles/MainLib.dir/main_lib.cpp.o: ../main_lib.cpp
CMakeFiles/MainLib.dir/main_lib.cpp.o: CMakeFiles/MainLib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kerim/Documents/TechProgSimpleLibrary/TechProgSimpleLibrary/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/MainLib.dir/main_lib.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/MainLib.dir/main_lib.cpp.o -MF CMakeFiles/MainLib.dir/main_lib.cpp.o.d -o CMakeFiles/MainLib.dir/main_lib.cpp.o -c /home/kerim/Documents/TechProgSimpleLibrary/TechProgSimpleLibrary/main_lib.cpp

CMakeFiles/MainLib.dir/main_lib.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MainLib.dir/main_lib.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kerim/Documents/TechProgSimpleLibrary/TechProgSimpleLibrary/main_lib.cpp > CMakeFiles/MainLib.dir/main_lib.cpp.i

CMakeFiles/MainLib.dir/main_lib.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MainLib.dir/main_lib.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kerim/Documents/TechProgSimpleLibrary/TechProgSimpleLibrary/main_lib.cpp -o CMakeFiles/MainLib.dir/main_lib.cpp.s

# Object files for target MainLib
MainLib_OBJECTS = \
"CMakeFiles/MainLib.dir/main_lib.cpp.o"

# External object files for target MainLib
MainLib_EXTERNAL_OBJECTS =

../bin/MainLib: CMakeFiles/MainLib.dir/main_lib.cpp.o
../bin/MainLib: CMakeFiles/MainLib.dir/build.make
../bin/MainLib: ../lib/libbuffer.so
../bin/MainLib: CMakeFiles/MainLib.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/kerim/Documents/TechProgSimpleLibrary/TechProgSimpleLibrary/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/MainLib"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/MainLib.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/MainLib.dir/build: ../bin/MainLib
.PHONY : CMakeFiles/MainLib.dir/build

CMakeFiles/MainLib.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/MainLib.dir/cmake_clean.cmake
.PHONY : CMakeFiles/MainLib.dir/clean

CMakeFiles/MainLib.dir/depend:
	cd /home/kerim/Documents/TechProgSimpleLibrary/TechProgSimpleLibrary/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kerim/Documents/TechProgSimpleLibrary/TechProgSimpleLibrary /home/kerim/Documents/TechProgSimpleLibrary/TechProgSimpleLibrary /home/kerim/Documents/TechProgSimpleLibrary/TechProgSimpleLibrary/build /home/kerim/Documents/TechProgSimpleLibrary/TechProgSimpleLibrary/build /home/kerim/Documents/TechProgSimpleLibrary/TechProgSimpleLibrary/build/CMakeFiles/MainLib.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/MainLib.dir/depend

