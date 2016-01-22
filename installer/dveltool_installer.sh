#!/bin/bash

echo "now running $0" ; echo "..............................................................................................." ; echo ""

MYDIR=/tmp
FLENAME=installer.sh

wget -O $MYDIR/$FLENAME $MYDIR https://raw.githubusercontent.com/dveltool/toolchain/master/installer/installer.sh
chmod +x $MYDIR/$FLENAME
$MYDIR/$FLENAME
rm $MYDIR/$FLENAME
