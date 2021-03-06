# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.7

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/cmake/bin/cmake

# The command to remove a file.
RM = /opt/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/appu/g2o_coding_sample

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/appu/g2o_coding_sample/build

# Include any dependencies generated for this target.
include g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/depend.make

# Include the progress variables for this target.
include g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/progress.make

# Include the compile flags for this target's objects.
include g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/flags.make

g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/solver_csparse.cpp.o: g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/flags.make
g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/solver_csparse.cpp.o: ../g2o/g2o/solvers/csparse/solver_csparse.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/appu/g2o_coding_sample/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/solver_csparse.cpp.o"
	cd /home/appu/g2o_coding_sample/build/g2o/g2o/solvers/csparse && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/solver_csparse.dir/solver_csparse.cpp.o -c /home/appu/g2o_coding_sample/g2o/g2o/solvers/csparse/solver_csparse.cpp

g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/solver_csparse.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/solver_csparse.dir/solver_csparse.cpp.i"
	cd /home/appu/g2o_coding_sample/build/g2o/g2o/solvers/csparse && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/appu/g2o_coding_sample/g2o/g2o/solvers/csparse/solver_csparse.cpp > CMakeFiles/solver_csparse.dir/solver_csparse.cpp.i

g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/solver_csparse.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/solver_csparse.dir/solver_csparse.cpp.s"
	cd /home/appu/g2o_coding_sample/build/g2o/g2o/solvers/csparse && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/appu/g2o_coding_sample/g2o/g2o/solvers/csparse/solver_csparse.cpp -o CMakeFiles/solver_csparse.dir/solver_csparse.cpp.s

g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/solver_csparse.cpp.o.requires:

.PHONY : g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/solver_csparse.cpp.o.requires

g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/solver_csparse.cpp.o.provides: g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/solver_csparse.cpp.o.requires
	$(MAKE) -f g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/build.make g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/solver_csparse.cpp.o.provides.build
.PHONY : g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/solver_csparse.cpp.o.provides

g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/solver_csparse.cpp.o.provides.build: g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/solver_csparse.cpp.o


# Object files for target solver_csparse
solver_csparse_OBJECTS = \
"CMakeFiles/solver_csparse.dir/solver_csparse.cpp.o"

# External object files for target solver_csparse
solver_csparse_EXTERNAL_OBJECTS =

../g2o/lib/libg2o_solver_csparse.so: g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/solver_csparse.cpp.o
../g2o/lib/libg2o_solver_csparse.so: g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/build.make
../g2o/lib/libg2o_solver_csparse.so: ../g2o/lib/libg2o_csparse_extension.so
../g2o/lib/libg2o_solver_csparse.so: ../g2o/lib/libg2o_core.so
../g2o/lib/libg2o_solver_csparse.so: /usr/lib/x86_64-linux-gnu/libcxsparse.so
../g2o/lib/libg2o_solver_csparse.so: ../g2o/lib/libg2o_stuff.so
../g2o/lib/libg2o_solver_csparse.so: g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/appu/g2o_coding_sample/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library ../../../../../g2o/lib/libg2o_solver_csparse.so"
	cd /home/appu/g2o_coding_sample/build/g2o/g2o/solvers/csparse && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/solver_csparse.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/build: ../g2o/lib/libg2o_solver_csparse.so

.PHONY : g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/build

g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/requires: g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/solver_csparse.cpp.o.requires

.PHONY : g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/requires

g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/clean:
	cd /home/appu/g2o_coding_sample/build/g2o/g2o/solvers/csparse && $(CMAKE_COMMAND) -P CMakeFiles/solver_csparse.dir/cmake_clean.cmake
.PHONY : g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/clean

g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/depend:
	cd /home/appu/g2o_coding_sample/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/appu/g2o_coding_sample /home/appu/g2o_coding_sample/g2o/g2o/solvers/csparse /home/appu/g2o_coding_sample/build /home/appu/g2o_coding_sample/build/g2o/g2o/solvers/csparse /home/appu/g2o_coding_sample/build/g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : g2o/g2o/solvers/csparse/CMakeFiles/solver_csparse.dir/depend

