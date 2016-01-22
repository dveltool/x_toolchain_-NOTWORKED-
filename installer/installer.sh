#!/bin/bash
#
# about			: Raspberry Pi sofware development
# filename		: dveltool_installer.sh
# date			: 09-Jan-2016
# by			: Dedy Yasriady
#

echo "now running $0" ; echo "..............................................................................................." ; echo ""

DVELDIR=/opt/dveltool

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

mkdir -pv $DVELDIR/toolchain/build
mkdir -pv $DVELDIR/toolchain/ide

# 010 - wxWidgets :: BUILD
# ----------------------------------------------------------------------

$DVELDIR/toolchain/installer/wxWidgets/linux_x86-64_install.sh

# 020 - wxFormbuilder
# sourced from http://sourceforge.net/p/wxformbuilder/code/HEAD/tree/3.x/trunk/
# ----------------------------------------------------------------------

cd $DVELDIR/toolchain/build
PATH=/opt/dveltool/toolchain/x86_64/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/localx_/linux_x86-64_shared_release/bin:$PATH

if [ ! -d "wxFormBuilder" ]; then

	mkdir wxFormBuilder
	cd wxFormBuilder
	svn checkout svn://svn.code.sf.net/p/wxformbuilder/code/3.x/trunk head
	cd head
	chmod 755 create_build_files4.sh
	./create_build_files4.sh --rpath=/opt/dveltool/toolchain/x86_64/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/localx_/linux_x86-64_shared_release/lib
	cd build/3.0/gmake
	make config=release
	mkdir -pv $DVELDIR/toolchain/ide/wxFormBuilder
	yes | cp -Rf $DVELDIR/toolchain/build/wxFormBuilder/head/output $DVELDIR/toolchain/ide/wxFormBuilder
	# shortcut
	rm $DVELDIR/wxFormBuilder.desktop
	ln -s $DVELDIR/toolchain/installer/wxFormBuilder/wxFormBuilder.desktop $DVELDIR/wxFormBuilder.desktop

fi

# 030 - eclipse
# ----------------------------------------------------------------------

if [ ! -d "$DVELDIR/toolchain/ide/eclipse" ]; then

	ECFN=eclipse-cpp-luna-SR2-linux-gtk-x86_64.tar.gz
	wget -P $DVELDIR/toolchain/build -c http://mirror.atlas-it.de/eclipse/$ECFN
	cd $DVELDIR/toolchain/ide
	tar -xapvf $DVELDIR/toolchain/build/$ECFN
	# shortcut
	rm $DVELDIR/eclipse.desktop
	ln -s $DVELDIR/toolchain/installer/eclipse/eclipse.desktop $DVELDIR/eclipse.desktop
	# restore/set default configuration
	mkdir -pv $DVELDIR/toolchain/ide/eclipse/configuration/.settings
	cp $DVELDIR/toolchain/installer/eclipse/org.eclipse.ui.ide.prefs $DVELDIR/toolchain/ide/eclipse/configuration/.settings

fi

# 040 - workspace
# ----------------------------------------------------------------------

cp $DVELDIR/toolchain/installer/workspace $DVELDIR -R

# 100 - FINISH - -
# ----------------------------------------------------------------------

cd $DVELDIR

