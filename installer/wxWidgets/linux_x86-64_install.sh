#!/bin/bash

export BOARD=x86_64
export ABI=x86_64-buildroot-linux-gnu
export WXVER=wxWidgets-3.0.2.tar.bz2

#export PATH=:$PATH

wget -c -P /opt/dveltool/toolchain/build https://github.com/wxWidgets/wxWidgets/releases/download/v3.0.2/$WXVER

if [ ! -d "/opt/dveltool/toolchain/$BOARD/buildx_/wxWidgets-3.0.2" ]; then

	mkdir -pv /opt/dveltool/toolchain/$BOARD/buildx_
	cd /opt/dveltool/toolchain/$BOARD/buildx_
	tar -xjpvf /opt/dveltool/toolchain/build/wxWidgets-3.0.2.tar.bz2

fi

sh /opt/dveltool/toolchain/installer/wxWidgets/linux_x86-64_shared_debug.sh
sh /opt/dveltool/toolchain/installer/wxWidgets/linux_x86-64_shared_release.sh

