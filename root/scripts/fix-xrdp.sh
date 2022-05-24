#! /bin/bash
#
# Script to install fixes for XFCE4 with XRDP.
# Written by Rick Hoover on May 24th, 2022

XSESSION=/home/xilinx/.xsession

dpkg-reconfigure xserver-xorg-legacy
echo "env -u SESSION_MANAGER -u DBUS_SESSION_BUS_ADDRESS xfce4-session" > $XSESSION
chown xilinx:xilinx $XSESSION
sudo service xrdp restart
