#!/bin/bash
#
# about			: Raspberry Pi sofware development
# filename		: dveltool_installer.sh
# date			: 09-Jan-2016
# by			: Dedy Yasriady
#

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

# x86_64_shared // wxFormBuilder need this
sh $DVELDIR/toolchain/installer/wxWidgets/linux_x86-64_shared_release.sh











# 020 - wxFormbuilder
# sourced from http://sourceforge.net/p/wxformbuilder/code/HEAD/tree/3.x/trunk/
# ----------------------------------------------------------------------

cd $DVELDIR/toolchain/build

if [ -d "wxFormBuilder" ]; then
	rm -rf "wxFormBuilder"
fi

mkdir wxFormBuilder
cd wxFormbuilder
svn checkout svn://svn.code.sf.net/p/wxformbuilder/code/3.x/trunk head
cd head
chmod 755 create_build_files4.sh
./create_build_files4.sh
cd build/3.0/gmake
make config=release
mkdir -pv $DVELDIR/toolchain/ide/wxFormBuilder/head
mv $DVELDIR/toolchain/build/wxFormBuilder/head/output $DVELDIR/toolchain/ide/wxFormBuilder/head/output
# shortcut
rm $DVELDIR/wxFormBuilder.desktop
ln -s $DVELDIR/toolchain/installer/wxFormBuilder/wxFormBuilder.desktop $DVELDIR/wxFormBuilder.desktop

# 030 - eclipse
# ----------------------------------------------------------------------

if [ ! -d "$DVELDIR/toolchain/ide/eclipse" ]; then

	ECFN=eclipse-cpp-luna-SR2-linux-gtk-x86_64.tar.gz
	wget -P $DVELDIR/toolchain/build -c http://mirror.atlas-it.de/eclipse/$ECFN
	cd $DVELDIR/toolchain/ide
	tar -xapvf $ECFN
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

