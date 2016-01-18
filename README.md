Develop Raspberry Pi application easily with Eclipse IDE and cross compiler toolchain.
Create your application on linux desktop and run on Raspberry Pi 2.

REQUIREMENT:

Ubuntu:
- sudo apt-get install git subversion openjdk-8-jdk build-essential

HOW TO INSTALL:
-----------------------------------
- wget https://raw.githubusercontent.com/dveltool/toolchain/master/installer/dveltool_installer.sh
- chmod 755 dveltool_installer.sh
- ./dveltool_installer.sh

This IDE/Toolchain tested on following platform:
- Ubuntu 14.04-LTS Trusty Tahr (x86_64)

Available target board are:
- Raspberry Pi 2 Model B
- x84_64

The cross compiler toolchain was generated using buildroot.

This system composed by following application as the core component:
- eclipse IDE		(Luna)
- wxWidgets			(wxWidgets-3.0.2)
- wxFormbuilder		(wxFromBuilder v3.5-RC2)
- buildroot			(buildroot-2015.11.1)

Your comment and feedback highly appreciated to improve this system.

Disclaimer:
THE PROGRAM IS DISTRIBUTED IN THE HOPE THAT IT WILL BE USEFUL FOR PEOPLES, THIS PROGRAM IS PROVIDED "AS IS" AND WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED. 
