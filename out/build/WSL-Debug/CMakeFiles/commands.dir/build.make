# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.14

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
CMAKE_COMMAND = /home/atirath/.vs/cmake/bin/cmake

# The command to remove a file.
RM = /home/atirath/.vs/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/c/Users/Atirath/source/repos/CMPS109/ASG2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/c/Users/Atirath/source/repos/CMPS109/ASG2/out/build/WSL-Debug

# Include any dependencies generated for this target.
include CMakeFiles/commands.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/commands.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/commands.dir/flags.make

CMakeFiles/commands.dir/commands.cpp.o: CMakeFiles/commands.dir/flags.make
CMakeFiles/commands.dir/commands.cpp.o: ../../../commands.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/Atirath/source/repos/CMPS109/ASG2/out/build/WSL-Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/commands.dir/commands.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/commands.dir/commands.cpp.o -c /mnt/c/Users/Atirath/source/repos/CMPS109/ASG2/commands.cpp

CMakeFiles/commands.dir/commands.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/commands.dir/commands.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/Atirath/source/repos/CMPS109/ASG2/commands.cpp > CMakeFiles/commands.dir/commands.cpp.i

CMakeFiles/commands.dir/commands.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/commands.dir/commands.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/Atirath/source/repos/CMPS109/ASG2/commands.cpp -o CMakeFiles/commands.dir/commands.cpp.s

# Object files for target commands
commands_OBJECTS = \
"CMakeFiles/commands.dir/commands.cpp.o"

# External object files for target commands
commands_EXTERNAL_OBJECTS =

libcommands.so: CMakeFiles/commands.dir/commands.cpp.o
libcommands.so: CMakeFiles/commands.dir/build.make
libcommands.so: CMakeFiles/commands.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/c/Users/Atirath/source/repos/CMPS109/ASG2/out/build/WSL-Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library libcommands.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/commands.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/commands.dir/build: libcommands.so

.PHONY : CMakeFiles/commands.dir/build

CMakeFiles/commands.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/commands.dir/cmake_clean.cmake
.PHONY : CMakeFiles/commands.dir/clean

CMakeFiles/commands.dir/depend:
	cd /mnt/c/Users/Atirath/source/repos/CMPS109/ASG2/out/build/WSL-Debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Users/Atirath/source/repos/CMPS109/ASG2 /mnt/c/Users/Atirath/source/repos/CMPS109/ASG2 /mnt/c/Users/Atirath/source/repos/CMPS109/ASG2/out/build/WSL-Debug /mnt/c/Users/Atirath/source/repos/CMPS109/ASG2/out/build/WSL-Debug /mnt/c/Users/Atirath/source/repos/CMPS109/ASG2/out/build/WSL-Debug/CMakeFiles/commands.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/commands.dir/depend

