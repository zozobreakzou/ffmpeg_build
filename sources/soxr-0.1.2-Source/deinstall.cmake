# SoX Resampler Library       Copyright (c) 2007-13 robs@users.sourceforge.net
# Licence for this file: LGPL v2.1                  See LICENCE for details.

if (NOT EXISTS "/home/zozo/ffmpeg_build/sources/soxr-0.1.2-Source/install_manifest.txt")
  message (FATAL_ERROR "Cannot find install manifest")
endif ()

file (READ "/home/zozo/ffmpeg_build/sources/soxr-0.1.2-Source/install_manifest.txt" files)
string (REGEX REPLACE "\n" ";" files "${files}")
foreach (file ${files})
  set (dest "$ENV{DESTDIR}${file}")
  message (STATUS "Deinstalling \"${dest}\"")
  if (EXISTS "${dest}" OR IS_SYMLINK "${dest}")
    execute_process (
      COMMAND "/usr/bin/cmake" -E remove "${dest}"
      OUTPUT_VARIABLE rm_out
      RESULT_VARIABLE rm_retval
    )
    if (NOT ${rm_retval} EQUAL 0)
      message (FATAL_ERROR "Problem when removing \"${dest}\"")
    endif ()
  else ()
    message (STATUS "File \"${dest}\" does not exist.")
  endif ()
endforeach ()
