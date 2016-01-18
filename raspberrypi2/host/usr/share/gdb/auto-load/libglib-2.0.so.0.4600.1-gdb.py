import sys
import gdb

# Update module path.
dir_ = '/opt/dveltool/toolchain/raspberrypi2/buildx_/buildroot-2015.11.1/../../host/usr/share/glib-2.0/gdb'
if not dir_ in sys.path:
    sys.path.insert(0, dir_)

from glib import register
register (gdb.current_objfile ())
