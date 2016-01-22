#!/bin/bash

echo "now running $0" ; echo "..............................................................................................." ; echo ""






echo "PWD ------------------------- $PWD"





FILE=$0
filename=$(basename "$FILE")
extension="${filename##*.}"
filename="${filename%.*}"
BUILD=$filename

if [ ! -d "/opt/dveltool/toolchain/$BOARD/buildx_/wxWidgets-3.0.2/buildx_/$BUILD"  ]; then

	mkdir -pv /opt/dveltool/toolchain/$BOARD/buildx_/wxWidgets-3.0.2/buildx_/$BUILD
	cd /opt/dveltool/toolchain/$BOARD/buildx_/wxWidgets-3.0.2/buildx_/$BUILD

	# configure
	../../configure --with-gtk --prefix=/opt/dveltool/toolchain/$BOARD/host/usr/$ABI/sysroot/usr/localx_/$BUILD --with-libtiff=builtin --with-libjpeg=builtin --with-libpng=builtin --with-regex=builtin --with-zlib=builtin --with-expat=builtin LDFLAGS="-static-libstdc++ -static-libgcc" --enable-mediactrl --enable-debug
	make
	make install

fi




