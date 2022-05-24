#! /bin/bash
#
# Script to install XFCE4 desktop that allows one to login with Remote Desktop.
# This script requires a network connection.
# Written by Rick Hoover on May 24th, 2022

tasksel --new-install install desktop xfce-desktop  2>/dev/null
./set-runlevel.sh -t
