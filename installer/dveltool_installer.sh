#!/bin/bash
#
# about			: Raspberry Pi sofware development
# filename		: dveltool_installer.sh
# date			: 09-Jan-2016
# by			: Dedy Yasriady
#

DVELDIR=/opt/dveltool

TCDIR=$DVELDIR/toolchain
BUILDIR=$TCDIR/build
IDEDIR=$TCDIR/ide
INSTALLERDIR=$TCDIR/installer

MYTS=$(date +%s)

# 000 - Toolchain
# ----------------------------------------------------------------------

# Ddy: do this first, most top priority
sudo mkdir $DVELDIR ; sudo chown $USER $DVELDIR -R ; cd $DVELDIR

if [ -d "toolchain" ]; then
	cd toolchain	
	git pull
	cd ..
else
	git clone https://github.com/dveltool/toolchain.git
fi

# 005 - prepare directory
# ----------------------------------------------------------------------

mkdir -pv $BUILDIR
mkdir -pv $IDEDIR/wxFormbuilder/head
mkdir -pv $INSTALLERDIR

# 010 - wxWidgets :: installation in the host
# ----------------------------------------------------------------------

#sudo apt-get install libwxgtk3.0-0 libwxgtk3.0-dev
#sudo apt-get install libwxgtk-media*
#sudo apt-get install libwxbase3.0-dev libwxgtk3.0-0 libwxgtk-media3.0-0 libwxgtk3.0-dev libwxgtk-media3.0-dev

# 020 - wxFormbuilder
# sourced from http://sourceforge.net/p/wxformbuilder/code/HEAD/tree/3.x/trunk/
# ----------------------------------------------------------------------

if [ ! -d "$DVELDIR/toolchain/ide/wxFormbuilder" ]; then
	cp -R $DVELDIR/toolchain/installer/wxFormbuilder/ $DVELDIR/toolchain/ide/
fi

rm $DVELDIR/wxformbuilder.desktop
ln -s $DVELDIR/toolchain/installer/desktop/wxformbuilder.desktop $DVELDIR/wxformbuilder.desktop

# 030 - eclipse
# ----------------------------------------------------------------------

if [ ! -d "$DVELDIR/toolchain/ide/eclipse" ]; then

	ECFN=eclipse-cpp-luna-SR2-linux-gtk-x86_64.tar.gz
	cd $DVELDIR/toolchain/build
	wget -c http://mirror.atlas-it.de/eclipse/$ECFN
	tar -xapvf $ECFN
	mv eclipse $DVELDIR/toolchain/ide
	# shortcut
	$DVELDIR/eclipse.desktop
	ln -s $DVELDIR/toolchain/installer/desktop/eclipse.desktop $DVELDIR/eclipse.desktop
	# restore/set default configuration
	mkdir -pv $DVELDIR/toolchain/ide/eclipse/configuration/.settings
	cp $DVELDIR/toolchain/installer/eclipse/org.eclipse.ui.ide.prefs $DVELDIR/toolchain/ide/eclipse/configuration/.settings

fi

# 040 - workspace
# ----------------------------------------------------------------------

cp $DVELDIR/toolchain/installer/workspace $DVELDIR -R

# 050 - decompress oversize lib.a
# ----------------------------------------------------------------------

# restore oversized library of raspberrypi2
cd /opt/dveltool/toolchain/raspberrypi2/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/local/wx3ud_static/lib
tar -xapvf libwx_gtk2u_core-3.0-arm-linux.a.tar.gz

# restore oversized library of x86_64
cd /opt/dveltool/toolchain/x86_64/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/local/wx3ud_static/lib
tar -xapvf libwx_baseu-3.0.a.tar.gz
tar -xapvf libwx_gtk2u_core-3.0.a.tar.gz
 
# 100 - FINISH - -
# ----------------------------------------------------------------------

cd $DVELDIR

