# Scripts included with RFSoC4x2 in /root/scripts

This directory contains scripts that can be used to enhance Linux on the SD card.  

## Getting Started

The first script to run will extend the Linux partition to the maximum size allowed and builds a swap file.  Use the "cd /root/scripts" command to enter the scripts directory and then type "./build-swap.sh -e".  The "-e" option will first extend the Linux partition before creating the swap file.  Note that it is imprtant that the Linux partition have enough space available before creating the swap file.

In summary, once booted for the first time, run the following from the /root/scripts directory:

```
./build-swap.sh -e
```

### Prerequisites

You will need a RFSoC4x2 Rev. B to run the default image provided on-line.  To fully utilize the Linux system on the RFSoC4x2, you will need the following:

 * A 12V 2.5A USB power supply that plugs into the POWER jack.

 * An active Ethernet connection to the ETHERNET port.

Some of the install scripts require a network connection to run properly.  The scripts that require a network connection are noted below in the "Installing Options" section.


### Installing Options

There are scripts for setting up some options included.  The scripts include:

 * build-swap.sh: Builds a swap file and extends the Linux partition to the maximum size of the SD card when using the -e option.  This script is described above in the "Getting Started" section.

 * install-desktop.sh: Install the XFCE4 desktop.  Note that Firefox is also installed as a part of the install-desktop.sh script.  This script requires a network connection.

 * install-xrdp.sh: Installs a Remote Desktop server so that a Remote Desktop client can log in and utilize a graphical interface.  This script requires a network connection.

 * fix-xrdp.sh: Installs fixes for xrdp with XFCE4 window manager.  When asked to select "Users allowed to start the X server:", select "Anybody".

 * install-gvim.sh: Installs a graphical version of vim for use with X Windows.  This script requires a network connection.

 * install-lazarus.sh: Installs the Lazarus IDE, which is a graphical RAD development tool that generates Free Pascal programs.  For more details, see <http://lazarus-ide.org>.  This script requires a network connection.

 * set-runlevel.sh: The -g option will set the default to graphical login mode while the -t option will restore the default to text mode.  For remote access with xrdp, there is no need to run this script.
