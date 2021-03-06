#!/bin/sh
#
# pre-requirement:
# apt-get install mingw-w64
# apt-get install binutils-mingw-w64
# apt-get install mingw-w64-common
# apt-get install mingw-w64-tools
#
# remove pthread dynamic lib to force ffmpeg link to the static pthread version:
# mv /usr/x86_64-w64-mingw32/lib/libpthread.dll.a       /usr/x86_64-w64-mingw32/lib/hide_libpthread.dll.a
# mv /usr/x86_64-w64-mingw32/lib/libwinpthread.dll.a    /usr/x86_64-w64-mingw32/lib/hide_libwinpthread.dll.a
#
# cd sources/yasm-1.3.0
# ./configure --prefix="${INSTALL_PREFIX}" --bindir="/usr/bin" --sbindir="/usr/sbin"
# make
# make install
# cd ../..
# 
# cd sources/nasm-2.13.01
# ./autogen.sh
# ./configure --prefix="${INSTALL_PREFIX}" --bindir="/usr/bin" --sbindir="/usr/sbin"
# make
# make install
# cd ../..
#

set -o errexit

build_start_time=`date +%s`

TARGET_OS="win64"
TARGET_HOST="x86_64-w64-mingw32"
INSTALL_PREFIX="$HOME/ffmpeg_build/build_out/${TARGET_OS}"
export PKG_CONFIG_PATH="${INSTALL_PREFIX}/lib/pkgconfig"

CROSS_PREFIX="${TARGET_HOST}-"
MAKE_PREFIX_OPTIONS="CC=${CROSS_PREFIX}gcc CXX=${CROSS_PREFIX}g++ AR=${CROSS_PREFIX}ar PREFIX=${INSTALL_PREFIX} RANLIB=${CROSS_PREFIX}ranlib LD=${CROSS_PREFIX}ld STRIP=${CROSS_PREFIX}strip"

rm -rf "${INSTALL_PREFIX}"

echo -e "\033[31mbuild zlib...\033[0m"
cd sources/zlib-1.2.11
./configure --prefix="${INSTALL_PREFIX}" --static
make clean
make -j 6 ${MAKE_PREFIX_OPTIONS} VERBOSE=1
make install VERBOSE=1
cd ../..
echo -e "\033[32mbuild zlib done\033[0m"

echo -e "\033[31mbuild libpng...\033[0m"
cd sources/libpng
./configure --host="$TARGET_HOST" --prefix="${INSTALL_PREFIX}" --disable-shared --enable-static LDFLAGS="-L${INSTALL_PREFIX}/lib" CPPFLAGS="-I${INSTALL_PREFIX}/include"
make clean
make -j 6 VERBOSE=1
make install VERBOSE=1
cd ../..
echo -e "\033[32mbuild libpng done\033[0m"

echo -e "\033[31mbuild fdk-aac...\033[0m"
cd sources/fdk-aac
./autogen.sh
./configure --host="$TARGET_HOST" --prefix="${INSTALL_PREFIX}" --disable-shared --enable-static
make clean
make -j 6 VERBOSE=1
make install VERBOSE=1
cd ../..
echo -e "\033[32mbuild fdk-aac done\033[0m"

echo -e "\033[31mbuild freetype...\033[0m"
cd sources/freetype2
./autogen.sh
./configure --host="$TARGET_HOST" --prefix="${INSTALL_PREFIX}" --disable-shared --enable-static
make clean
make -j 6 VERBOSE=1
make install VERBOSE=1
cd ../..
echo -e "\033[32mbuild freetype done\033[0m"

echo -e "\033[31mbuild frei0r...\033[0m"
cd sources/frei0r
./autogen.sh
./configure --host="$TARGET_HOST" --prefix="${INSTALL_PREFIX}" --enable-static --disable-shared
make clean
make -j 6 VERBOSE=1
make install VERBOSE=1
cd ../..
echo -e "\033[32mbuild frei0r done\033[0m"

echo -e "\033[31mbuild fribidi...\033[0m"
cd sources/fribidi
./bootstrap
./configure --host="$TARGET_HOST" --prefix="${INSTALL_PREFIX}" --disable-shared --enable-static --disable-debug --disable-deprecated
make clean
make -j 6 VERBOSE=1
make install VERBOSE=1
cd ../..
echo -e "\033[32mbuild fribidi done\033[0m"

echo -e "\033[31mbuild lame...\033[0m"
cd sources/lame-3.99.5
./configure --host="$TARGET_HOST" --prefix="${INSTALL_PREFIX}" --disable-shared --enable-static --enable-nasm 
make clean
make -j 6 VERBOSE=1
make install VERBOSE=1
cd ../..
echo -e "\033[32mbuild lame done\033[0m"

echo -e "\033[31mbuild libass...\033[0m"
cd sources/libass
./autogen.sh
./configure --host="$TARGET_HOST" --prefix="${INSTALL_PREFIX}" --disable-shared --enable-static --disable-require-system-font-provider
make clean
make -j 6 VERBOSE=1
make install VERBOSE=1
cd ../..
echo -e "\033[32mbuild libass done\033[0m"

echo -e "\033[31mbuild libilbc...\033[0m"
cd sources/libilbc
autoreconf -fiv
./configure --host="$TARGET_HOST" --prefix="${INSTALL_PREFIX}" --disable-shared --enable-static
make clean
make -j 6 VERBOSE=1
make install VERBOSE=1
cd ../..
echo -e "\033[32mbuild libilbc done\033[0m"

echo -e "\033[31mbuild ogg...\033[0m"
cd sources/ogg
./autogen.sh
./configure --host="$TARGET_HOST" --prefix="${INSTALL_PREFIX}" --disable-shared --enable-static
make clean
make -j 6 VERBOSE=1
make install VERBOSE=1
cd ../..
echo -e "\033[32mbuild ogg done\033[0m"

echo -e "\033[31mbuild libsndfile...\033[0m"
cd sources/libsndfile
./autogen.sh
./configure --host="$TARGET_HOST" --prefix="${INSTALL_PREFIX}" --disable-shared --enable-static --disable-sqlite --disable-external-libs --disable-full-suite
make clean
make -j 6 VERBOSE=1
make install VERBOSE=1
install -m644 src/GSM610/.libs/libgsm.a ${INSTALL_PREFIX}/lib/libgsm.a
install -m644 src/GSM610/.libs/libgsm.la ${INSTALL_PREFIX}/lib/libgsm.la
install -m644 -D src/GSM610/gsm.h ${INSTALL_PREFIX}/include/gsm.h
cd ../..
echo -e "\033[32mbuild libsndfile done\033[0m"

echo -e "\033[31mbuild libvorbis...\033[0m"
cd sources/libvorbis-1.3.5
./autogen.sh
./configure --host="$TARGET_HOST" --prefix="${INSTALL_PREFIX}" --disable-shared --enable-static --disable-docs --disable-examples --disable-oggtest
make clean
make -j 6 VERBOSE=1
make install VERBOSE=1
cd ../..
echo -e "\033[32mbuild libvorbis done\033[0m"

echo -e "\033[31mbuild libvpx...\033[0m"
export CROSS="$CROSS_PREFIX"
cd sources/libvpx
./configure --target="x86_64-win64-gcc" --prefix="${INSTALL_PREFIX}" --disable-shared --enable-static --disable-examples --disable-tools --disable-docs --disable-unit-tests --enable-vp9-highbitdepth
make clean
make -j 6 VERBOSE=1
make install VERBOSE=1
cd ../..
unset CROSS
echo -e "\033[32mbuild libvpx done\033[0m"

echo -e "\033[31mbuild mfx_dispatch...\033[0m"
cd sources/mfx_dispatch
autoreconf -fiv
./configure --host="$TARGET_HOST" --prefix="${INSTALL_PREFIX}" --disable-shared --enable-static
make clean
make -j 6 VERBOSE=1
make install VERBOSE=1
cd ../..
echo -e "\033[32mbuild mfx_dispatch done\033[0m"

echo -e "\033[31mbuild opencore-amr...\033[0m"
cd sources/opencore-amr
autoreconf -fiv
./configure --host="$TARGET_HOST" --prefix="${INSTALL_PREFIX}" --disable-shared --enable-static
make clean
make -j 6 VERBOSE=1
make install VERBOSE=1
cd ../..
echo -e "\033[32mbuild opencore-amr done\033[0m"

echo -e "\033[31mbuild openjpeg...\033[0m"
cd sources/openjpeg
find . -name "CMakeFiles" |xargs rm -rf
find . -name "CMakeCache.txt" |xargs rm -rf
cmake -G"Unix Makefiles" . -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}" -DBUILD_SHARED_LIBS=0 -DBUILD_CODEC=0 -DCMAKE_SYSTEM_NAME=Windows -DCMAKE_TOOLCHAIN_FILE=../../toolchain-mingw64.cmake
make clean
make -j 6 VERBOSE=1
make install VERBOSE=1
cd ../..
echo -e "\033[32mbuild openjpeg done\033[0m"

echo -e "\033[31mbuild opus...\033[0m"
cd sources/opus-1.2.1
./configure --host="$TARGET_HOST" --prefix="${INSTALL_PREFIX}" --disable-shared --enable-static --disable-doc --disable-extra-programs
make clean
make -j 6 VERBOSE=1
make install VERBOSE=1
cd ../..
echo -e "\033[32mbuild opus done\033[0m"

echo -e "\033[31mbuild soxr...\033[0m"
cd sources/soxr-0.1.2-Source
find . -name "CMakeFiles" |xargs rm -rf
find . -name "CMakeCache.txt" |xargs rm -rf
cmake -G"Unix Makefiles" . -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}" -DBUILD_SHARED_LIBS=0 -DHAVE_WORDS_BIGENDIAN_EXITCODE=0 -DWITH_OPENMP=0 -DBUILD_TESTS=0 -DBUILD_EXAMPLES=0 -DCMAKE_SYSTEM_NAME=Windows  -DCMAKE_TOOLCHAIN_FILE=../../toolchain-mingw64.cmake
make clean
make -j 6 VERBOSE=1
make install VERBOSE=1
cd ../..
echo -e "\033[32mbuild soxr done\033[0m"

echo -e "\033[31mbuild speex...\033[0m"
cd sources/speex
./autogen.sh
./configure --host="$TARGET_HOST" --prefix="${INSTALL_PREFIX}" --disable-shared --enable-static
make clean
make -j 6 VERBOSE=1
make install VERBOSE=1
cd ../..
echo -e "\033[32mbuild speex done\033[0m"

echo -e "\033[31mbuild x264...\033[0m"
cd sources/x264
./configure --host="$TARGET_HOST" --cross-prefix="${TARGET_HOST}-" --prefix="${INSTALL_PREFIX}" --disable-shared --enable-static --disable-cli --enable-strip
make clean
make -j 6 VERBOSE=1
make install VERBOSE=1
cd ../..
echo -e "\033[32mbuild x264 done\033[0m"

echo -e "\033[31mbuild xvidcore...\033[0m"
cd sources/xvid/xvidcore/build/generic
./bootstrap.sh
./configure --host="$TARGET_HOST" --prefix="${INSTALL_PREFIX}" --disable-shared --enable-static
make clean
make -j 6 VERBOSE=1
make install VERBOSE=1
rm -rf ${INSTALL_PREFIX}/lib/libxvidcore.dll.a
cd ../../../../../
echo -e "\033[32mbuild xvidcore done\033[0m"

echo -e "\033[31mbuild ffmpeg...\033[0m"
cd sources/ffmpeg
./configure \
--enable-cross-compile \
--arch="x86_64" \
--target-os="mingw64" \
--cross-prefix="${TARGET_HOST}-" \
--prefix="${INSTALL_PREFIX}/ffmpeg" \
--pkg-config-flags="--static" \
--extra-cflags="-I${INSTALL_PREFIX}/include" \
--extra-ldflags="-L${INSTALL_PREFIX}/lib" \
--disable-w32threads \
--disable-debug \
--enable-gpl \
--enable-version3 \
--enable-nonfree \
--disable-static \
--enable-shared \
--enable-gray \
--enable-swscale-alpha \
--disable-ffplay \
--disable-ffserver \
--disable-doc \
--enable-avresample \
--disable-encoders \
--enable-encoder=aac \
--enable-encoder=libx264 \
--enable-frei0r \
--enable-libass \
--enable-libfdk-aac \
--enable-libilbc \
--enable-libgsm \
--enable-libfreetype \
--enable-libfribidi \
--enable-libmp3lame \
--enable-libopencore-amrnb \
--enable-libopencore-amrwb \
--enable-libopenjpeg \
--enable-libopus \
--enable-libsoxr \
--enable-libspeex \
--enable-libvorbis \
--enable-libvpx \
--enable-libx264 \
--enable-libxvid \
--disable-sdl2

make clean
make -j 6 VERBOSE=1
make install VERBOSE=1

cd ../..
echo -e "\033[32mbuild ffmpeg done\033[0m"

build_end_time=`date +%s`
build_duration_minutes=$(( ( build_end_time - build_start_time ) / 60 ))
build_duration_seconds=$(( ( build_end_time - build_start_time ) % 60 ))

echo -e "\033[32mbuild win64 done with ${build_duration_minutes}m:${build_duration_seconds}s.\033[0m"