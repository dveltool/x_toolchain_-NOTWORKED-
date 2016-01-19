dveltool is now BETA VERSION

Develop Raspberry Pi application easily with Eclipse IDE and cross compiler toolchain.
Create your application on linux desktop and run on Raspberry Pi 2.

REQUIREMENT:

Ubuntu:

$ sudo apt-get install git openjdk-8-jdk build-essential libgtk2.0-dev libxxf86vm-dev

HOW TO INSTALL:
-----------------------------------
$ wget https://raw.githubusercontent.com/dveltool/toolchain/master/installer.sh
$ chmod 755 installer.sh
$ ./installer.sh

This development IDE/Toolchain tested and running well on following platform:
- Ubuntu 14.04-LTS Trusty Tahr (x86_64)
- Linux Mint 17.3 (x86_64)

Available toolchain & target board:
- Raspberry Pi 2 Model B      => raspberrypi2
- Amd64 / x84_64              => x86_64

The cross compiler toolchain was generated using buildroot.

This system made of following application as the core components:
- eclipse IDE		(Luna)
- wxWidgets			(wxWidgets-3.0.2)
- wxFormbuilder	(wxFromBuilder v3.5-RC2)
- buildroot			(buildroot-2015.11.1)
- Linux

Your comment and feedback highly appreciated to improve this system.

Disclaimer:
THE PROGRAM IS DISTRIBUTED IN THE HOPE THAT IT WILL BE USEFUL FOR PEOPLES, THIS PROGRAM IS PROVIDED "AS IS" AND WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED. 
