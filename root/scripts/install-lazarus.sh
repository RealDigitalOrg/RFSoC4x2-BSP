#! /bin/bash
#
# Script to install Lazarus, a Free Pascal IDE for a variety of platforms.
# This script requires a network connection.
# Written by Rick Hoover on February 18th, 2019

apt install lazarus

# Create links to crtbegin.o and crtend.o
cd /usr/lib
ln -s gcc/aarch64-linux-gnu/8/crtbegin.o .
ln -s gcc/aarch64-linux-gnu/8/crtend.o .
