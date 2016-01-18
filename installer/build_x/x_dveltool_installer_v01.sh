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
git clone https://github.com/dveltool/toolchain.git

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

#cd $BUILDIR

#mkdir wxFormbuilder
#cd wxFormbuilder
#svn checkout svn://svn.code.sf.net/p/wxformbuilder/code/3.x/trunk head
#cd head
#chmod 755 create_build_files4.sh
#./create_build_files4.sh
#cd build/3.0/gmake
#make config=release
#cd $BUILDIR
#mv wxFormbuilder/head/output $IDEDIR/wxFormbuilder/head/
ln -s $INSTALLERDIR/desktop/wxformbuilder.desktop $DVELDIR/

# 030 - eclipse
# ----------------------------------------------------------------------

cd $BUILDIR

ECFN=eclipse-cpp-luna-SR2-linux-gtk-x86_64.tar.gz
wget -c http://mirror.atlas-it.de/eclipse/$ECFN
tar -xapvf $ECFN
mv $IDEDIR/eclipse $IDEDIR/eclipse-$MYTS
mv eclipse $IDEDIR
# shortcut
ln -s $INSTALLERDIR/desktop/eclipse.desktop $DVELDIR/
# restore/set default configuration
mkdir -pv $TCDIR/ide/eclipse/configuration/.settings
cp $TCDIR/installer/eclipse/org.eclipse.ui.ide.prefs $TCDIR/ide/eclipse/configuration/.settings

# 040 - workspace
# ----------------------------------------------------------------------

cp $INSTALLERDIR/workspace $DVELDIR -R

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

