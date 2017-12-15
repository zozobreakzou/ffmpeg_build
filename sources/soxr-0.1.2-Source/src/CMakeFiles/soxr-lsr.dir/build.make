# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zozo/ffmpeg_build/sources/soxr-0.1.2-Source

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zozo/ffmpeg_build/sources/soxr-0.1.2-Source

# Include any dependencies generated for this target.
include src/CMakeFiles/soxr-lsr.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/soxr-lsr.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/soxr-lsr.dir/flags.make

src/CMakeFiles/soxr-lsr.dir/lsr.c.o: src/CMakeFiles/soxr-lsr.dir/flags.make
src/CMakeFiles/soxr-lsr.dir/lsr.c.o: src/lsr.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zozo/ffmpeg_build/sources/soxr-0.1.2-Source/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/CMakeFiles/soxr-lsr.dir/lsr.c.o"
	cd /home/zozo/ffmpeg_build/sources/soxr-0.1.2-Source/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/soxr-lsr.dir/lsr.c.o   -c /home/zozo/ffmpeg_build/sources/soxr-0.1.2-Source/src/lsr.c

src/CMakeFiles/soxr-lsr.dir/lsr.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/soxr-lsr.dir/lsr.c.i"
	cd /home/zozo/ffmpeg_build/sources/soxr-0.1.2-Source/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/zozo/ffmpeg_build/sources/soxr-0.1.2-Source/src/lsr.c > CMakeFiles/soxr-lsr.dir/lsr.c.i

src/CMakeFiles/soxr-lsr.dir/lsr.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/soxr-lsr.dir/lsr.c.s"
	cd /home/zozo/ffmpeg_build/sources/soxr-0.1.2-Source/src && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/zozo/ffmpeg_build/sources/soxr-0.1.2-Source/src/lsr.c -o CMakeFiles/soxr-lsr.dir/lsr.c.s

src/CMakeFiles/soxr-lsr.dir/lsr.c.o.requires:

.PHONY : src/CMakeFiles/soxr-lsr.dir/lsr.c.o.requires

src/CMakeFiles/soxr-lsr.dir/lsr.c.o.provides: src/CMakeFiles/soxr-lsr.dir/lsr.c.o.requires
	$(MAKE) -f src/CMakeFiles/soxr-lsr.dir/build.make src/CMakeFiles/soxr-lsr.dir/lsr.c.o.provides.build
.PHONY : src/CMakeFiles/soxr-lsr.dir/lsr.c.o.provides

src/CMakeFiles/soxr-lsr.dir/lsr.c.o.provides.build: src/CMakeFiles/soxr-lsr.dir/lsr.c.o


# Object files for target soxr-lsr
soxr__lsr_OBJECTS = \
"CMakeFiles/soxr-lsr.dir/lsr.c.o"

# External object files for target soxr-lsr
soxr__lsr_EXTERNAL_OBJECTS =

src/libsoxr-lsr.a: src/CMakeFiles/soxr-lsr.dir/lsr.c.o
src/libsoxr-lsr.a: src/CMakeFiles/soxr-lsr.dir/build.make
src/libsoxr-lsr.a: src/CMakeFiles/soxr-lsr.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zozo/ffmpeg_build/sources/soxr-0.1.2-Source/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library libsoxr-lsr.a"
	cd /home/zozo/ffmpeg_build/sources/soxr-0.1.2-Source/src && $(CMAKE_COMMAND) -P CMakeFiles/soxr-lsr.dir/cmake_clean_target.cmake
	cd /home/zozo/ffmpeg_build/sources/soxr-0.1.2-Source/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/soxr-lsr.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/soxr-lsr.dir/build: src/libsoxr-lsr.a

.PHONY : src/CMakeFiles/soxr-lsr.dir/build

src/CMakeFiles/soxr-lsr.dir/requires: src/CMakeFiles/soxr-lsr.dir/lsr.c.o.requires

.PHONY : src/CMakeFiles/soxr-lsr.dir/requires

src/CMakeFiles/soxr-lsr.dir/clean:
	cd /home/zozo/ffmpeg_build/sources/soxr-0.1.2-Source/src && $(CMAKE_COMMAND) -P CMakeFiles/soxr-lsr.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/soxr-lsr.dir/clean

src/CMakeFiles/soxr-lsr.dir/depend:
	cd /home/zozo/ffmpeg_build/sources/soxr-0.1.2-Source && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zozo/ffmpeg_build/sources/soxr-0.1.2-Source /home/zozo/ffmpeg_build/sources/soxr-0.1.2-Source/src /home/zozo/ffmpeg_build/sources/soxr-0.1.2-Source /home/zozo/ffmpeg_build/sources/soxr-0.1.2-Source/src /home/zozo/ffmpeg_build/sources/soxr-0.1.2-Source/src/CMakeFiles/soxr-lsr.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/soxr-lsr.dir/depend
