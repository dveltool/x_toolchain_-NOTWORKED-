#!/bin/bash

FLENAME=~/dveltool_installer.sh

if [ -f "$FLENAME" ]; then
	rm $FLENAME
fi

wget -O $FLENAME https://raw.githubusercontent.com/dveltool/toolchain/master/installer/dveltool_installer.sh
chmod +x $FLENAME
sh $FLENAME
rm $FLENAME
