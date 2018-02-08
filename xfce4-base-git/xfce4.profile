#
# /etc/profile.d/xfce4.sh
#

XFCE4DIR=/opt/xfce

PATH=$PATH:$XFCE4DIR/bin
MANPATH=$MANPATH:$XFCE4DIR/man
export PATH MANPATH

if [ -z $PKG_CONFIG_PATH ]; then
	PKG_CONFIG_PATH=$XFCE4DIR/lib/pkgconfig
else
	PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$XFCE4DIR/lib/pkgconfig
fi
export PKG_CONFIG_PATH

if [ -z $PYTHONPATH ]; then
	PYTHONPATH=$XFCE4DIR/lib/python2.6/site-packages
else
	PYTHONPATH=$PKG_CONFIG_PATH:$XFCE4DIR/lib/python2.6/site-packages
fi
export PYTHONPATH

