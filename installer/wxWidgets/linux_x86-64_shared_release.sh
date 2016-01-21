#!/bin/bash

BOARD=x86_64
ABI=x86_64-buildroot-linux-gnu

#PATH=:$PATH

# --------

FILE=$0
filename=$(basename "$FILE")
extension="${filename##*.}"
filename="${filename%.*}"
BUILD=$filename

wget -c -P /opt/dveltool/toolchain/build https://github.com/wxWidgets/wxWidgets/releases/download/v3.0.2/wxWidgets-3.0.2.tar.bz2
mkdir -pv /opt/dveltool/toolchain/$BOARD/buildx_
cd /opt/dveltool/toolchain/$BOARD/buildx_
tar -xjpvf /opt/dveltool/toolchain/build/wxWidgets-3.0.2.tar.bz2
mkdir -pv wxWidgets-3.0.2/buildx_/$BUILD
cd wxWidgets-3.0.2/buildx_/$BUILD

# configure
../../configure --with-gtk --prefix=/opt/dveltool/toolchain/$BOARD/host/usr/$ABI/sysroot/usr/localx_/$BUILD --with-libtiff=builtin --with-libjpeg=builtin --with-libpng=builtin --with-regex=builtin --with-zlib=builtin --with-expat=builtin LDFLAGS="-static-libstdc++ -static-libgcc" --enable-mediactrl
make
make install


