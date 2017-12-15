#!/bin/sh
#

set -o errexit

./build_win32.sh    |tee win32.log
./build_win64.sh    |tee win64.log
./build_linux32.sh  |tee linux32.log
./build_linux64.sh  |tee linux64.log