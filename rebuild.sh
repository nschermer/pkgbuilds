#!/bin/sh

if [ ! -c "$(tty)" ];
then
  echo "You must run this command from within a terminal!"
  exit 1
fi

if [ -c "$MY_XFCE_GIT_DIR" ];
then
  echo "MY_XFCE_GIT_DIR variable is not set!"
  exit 1
fi

basedir=$(pwd)

if [ ! "$1" = "" ];
then
  packages="$@"
else
  packages="xfce4-base-git xfce4-dev-tools-git libxfce4util-git xfconf-git libxfce4ui-git garcon-git"
  packages="$packages  exo-git xfce4-panel-git thunar-git xfce4-terminal-git thunar-volman-git"
  packages="$packages tumbler-git xfce4-appfinder-git xfce4-session-git xfce4-settings-git"
  packages="$packages xfwm4-git xfdesktop-git xfce4-notifyd-git ristretto-git"
fi

for package in $packages;
do
  echo "Building $package..."

  cd $basedir/$package || break
  rm -Rf "$basedir/$package/pkg" "$basedir/$package/src"
  makepkg -cfi -s --noconfirm &> makepkg.log || exit 1
done

echo
echo "Building completed!"

cd $basedir
