#!/bin/bash

MYDIR=/tmp
FLENAME=installer.sh

wget -O $MYDIR/$FLENAME $MYDIR https://raw.githubusercontent.com/dveltool/toolchain/master/installer/installer.sh
chmod +x $MYDIR/$FLENAME
sh $MYDIR/$FLENAME
rm $MYDIR/$FLENAME
