# RFSoC4x2-BSP
## Documentation Sections

 - Pre-built Image
 - Requirements
 - Download Design
 - Install Board Files
 - Build Hardware
 - Build PetaLinux
 - Build SD Card
 - Using Linux on RFSoC4x2

## Pre-built Image
There is a pre-built SD card image available on-line.  Read the "Build SD Card"
section that describes how to create and use the pre-built image.  The
implementation presented here for the RFSoC4x2 provides a smaller set of board
functionality than is provided by the PYNQ release.

## Requirements
 - Vivado 2020.2 loaded and operational.  Newer versions may work, but there may be some porting effort required.
 - Windows PC or Linux PC for Vivado.
 - Linux PC for PetaLinux due to PetaLinux limitations.
 - A 16 GByte, or larger, microSD FLASH card to boot Linux.   It is recommended one use a Class 10 microSD card or better.

## Download Design
 - Use "git clone" to copy this git repository from github to a local machine.

## Install Board Files
 - The Vivado "board.repoPaths" parameter must be set to the path of the
   "board_files" directory.  You can edit the Vivado_init.tcl startup script
   and add the line shown below.  If the script does not exist, create it.

   ```
   set_param board.repoPaths [list "<path to board_files>"]
   ```

   Substitute in the real path for <path_to_board_files> above.  When you run
   Vivado, the Vivado_int.tcl script will be executed.

   The location of the Vivado_init.tcl file for Linux and Windows is:
   - Linux: From your home directory, in the ".Xilinx/Vivado" subdirectory
   - Windows: From your home directory, in the "AppData\Xilinx\Vivado"
     subdirectory.  The path to "AppData" is in the environment variable
     "APPDATA".

## Build Hardware
 - Launch Vivado.
 - The hardware project can now be created by running a script by click "Tools -> Run Tcl Script..." and select "design_1.tcl" in the "hw" directory and click "OK".
 - Once the hardware project has been created with a loaded design, click the "Generate Bitstream" button located on the lower-left column. This will kick off the hardware synthesis, implementation, and generation of the bitstream.
 - After generation of the bitstream, export the design to the "sw" directory by selecting "File -> Export -> Export Hardware" and click "Next".
 - When the "Export Hardware" dialog comes up asking for the Output type, select "Include bitstream" and click "Next".
 - In the next page, select the "sw" subdirectory for "Export to" and click "Next" and then "Finish".

## Build PetaLinux
There are a couple of ways to build PetaLinux for the board.  The two methods are covered in this section.

### Using a BSP file
The simple way to build PetaLinux is to use one of the checked in BSPs in the "bsp\_releases" subdirectory.  Make sure that the selected BSP matches the version of PetaLinux used for the build process.  To perform this build, use the following steps:

 - Source the "settings.sh" script file located in the root PetaLinux directory.
 - Use "cd" to set the present working directory to the "sw" subdirectory.
 - Run ```"petalinux-create -t project -s <path to BSP file>"```
   where \<path to BSP file\> is the path to the appropriate BSP file in 
   "bsp\_releases".   
 - Use "cd" to enter the "RFSoC4x2_BSP" directory that was just created by the above step.
 - Run the ```"petalinux-config --silentconfig"``` command to initialize the PetaLinux configuration.
 - Run the ```"petalinux-build"``` command to build the PetaLinux system.  This
   step will take from several minutes and possibly more than an hour depending on
   the speed of the internet connection and the speed of the PC.
 - Upon completion of the above step, run ```"petalinux-package --boot --u-boot
   --fpga images/linux/system.bit"```.  This step creates the BOOT.BIN file
   needed for installation on the SD Card.

### Using the Exported Hardware Definition
The process described here should be used when there is no valid BSP available.  For example, when the hardware design has been customized, one should use the process listed here instead.

 - Source the "settings.sh" script file located in the root PetaLinux directory.
 - Use "cd" to set the present working directory to the "sw" subdirectory.
 - Run ```"petalinux-create -t project -n <name for project> --template zynqMP"```.
   This will create a new project with a name of <name for project> that is for
   the ZynqMP.
 - Use "cd" to enter the project after it has been created by the above step.
 - Run the command ```"petalinux-config --get-hw-description .."```  to load in
   the hardware design exported in the "Build Hardware" section.
 - At this point, customization of the device tree can be performed by editing the
   file "project-spec/meta-user/recipes-bsp/device-tree/files/system-user.dtsi". 
   The customized device tree used for the hardware design supported here is
   located in
   "petalinux_bsp/meta-user/recipes-bsp/device-tree/files/system-user.dtsi"
   as a reference.
 - To access the OLED from user space, the "devspi" driver needs to be added to
   the kernel configuration.  To configure the kernel, execute the command
   ```"petalinux-config -c kernel"```.  This can take several minutes of
   execution time before menu pops up in a new window.  Once the menu is up,
   follow these steps:
   
   - Select "Device Drivers --->".
   - Scroll down and select "SPI support --->".
   - Scroll down to "User mode SPI device driver support" and tap <space>
     twice to get an asterisk in the selection column.
   - Use Exit three times to get back to the main menu and then out of the
     configuration program.
   - When prompted, save the configuration.
 - Run the ```"petalinux-build"``` command to build the PetaLinux system.  This
   step will take from several minutes and possibly more than an hour depending
   on the speed of the internet connection and the speed of the PC.
 - Upon completion of the above step, run
   ```"petalinux-package --boot --u-boot --fpga images/linux/system.bit"```.
   This step creates the BOOT.BIN file needed for installation on the SD Card.

Other files created by running "petalinux-build" that should be copied to
the first SD card partition are "boot.scr", "image.ub", and "system.dtb".

## Build SD Card
1. Download the Debian Buster image from:
 
     <https://allterrainsw.com/wp-content/rfsoc4x2_24May2022.img.gz>
     
2. Decompress the image file.
   - For Linux, "gunzip rfsoc4x2_24May2022.img.gz".
   - You can use WinZip to decompress the file in Windows.

3. The image needs to be burned onto the SD card.
   -   For Linux you can use
       ```"dd if=rfsoc4x2_24May2022.img of=/dev/sdX bs=512"``` where the X in
     sdX is replaced with the actual disk that represents the SD card device.
     
   - For Windows you can use imageUSB by PassMark Software.
     - Select the drive in "Step 1".
     - Select "Write image to USB drive" in "Step 2".
     - Browse to the "rfsoc4x2_24May2022.img" file created in "Step 3" using the 
       PassMark software.
     - Then click the "Write" button.
    
4. Unmount (Linux) or eject (Windows) the SD card from the PC and then insert
   it into the "SD MICRO" slot on the RFSoC4x2.
   
5. To boot Linux from the SD Card, make sure "BOOT" is set to "SD" and connect the
   external supply to "POWER", but don't turn on the power yet.
 
6. Plug the USB cable from "PROG UART" on the RFSoC4x2 board to the PC.  Bring up a
   terminal emulator -- like "minicom" on Linux or or "teraterm" on Windows -- to
   make a connection to the Linux console.  On Linux machines,
   the serial port is typically located at /dev/ttyUSB1.  On Windows, it should be
   one of the COM ports, like COM3 or COM4.  The port parameters should be set to
   115,200 baud, 8 bits, 1 stop bit, no parity, and no flow control.
   
7. Turn on the "PWR" switch to power-up the board.  Linux should boot with log
   messages being displayed on the main window of the terminal emulator.
   
## Using Linux on the RFSoC4x2
1. If you use the graphics login, ssh login, or the terminal login with this
   installation of Debian, the default password for the xilinx user is "xilinx".
   The default root pasword is "root", but you are still required to login as a
   normal user first.  So always log in as the "xilinx" user and then use
   "sudo -s" or "su - root" to log in as root.

2. The partition size for the ext4 Linux partition is only about 4 GBytes in
   size.  To fully use the 16 GByte or bigger SD card, utilize the
   "build-swap.sh" script located in the "/root/Scripts" directory.  To
   increase the Linux partition size and create the swap file, run the
   command ```"build-swap.sh -e"``` using a terminal from the "/root/scripts"
   directory.  The "-e" option tells the script to increase the Linux
   partition to fill the rest of the available space on the SD card.
   
3. To bring up networking, plug in a live Ethernet cable into the Ethernet port.
     
4. With networking operational, you can update the Debian packages.  To do
   the upgrade, use the following steps:
   - Type ```"apt update"``` to fetch the latest metadata for Debian.
   - Type ```"apt upgrade"``` to perform the actual update to the various
     packages installed on the system.

5. The system supports access through Remote Desktop after installing a desktop
   manager and xrdp.  To accomplish this installation, log in as "xilinx" and then
   run "sudo -s" to switch to root.  From there:
   - Execute ```"cd /root/scripts"```.
   - Then install the desktop manager by running ```"./install-desktop.sh"```.
     This step will take a while to complete.
   - When the above step completes, run ```"./install-xrdp.sh"```.
   - There is an issue with running XRDP and XFCE4 which can be fixed by running
     the script ```"./fix-xrdp.sh"```.  When asked to select "Users allowed
     to start the X server:", select "Anybody".
   - To run Remote Desktop, retrieve the IP address by running the command
     ```"ip route | grep eth0"```.  The IP address is the shown at the end of
     the line.  Use this IP address with Remote Desktop to make the connection.
 
6. To install gvim, run the command "./install-gvim.sh" from the "/root/scripts"
   subdirectory.

After performing the above steps, the system should be very functional for the
average user.