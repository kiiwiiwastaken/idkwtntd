#!/bin/bash
#
#
#
# This is the 0.1 installer for IDKWTNTD. This will have a seperate repository
# if anyone wants to a different arch-based livecd, this is temporary until the
# distro matures and becomes it's own thing.
#
#
# This is the pre-requisite script.

echo "Hello, and welcome to the 0.1 installer for IDKWTNTD. This first script is for pre-requisites."


## Wifi and time stuff
echo "Are you connecting via WiFi? [Y/N]"
read wifi

case $wifi in
	[Yy]* ) read -p "Okay, executing nmtui... [Press ENTER]"; nmtui;;
	[Nn]* ) read -p "Okay, continuing... [Press ENTER]";;
	* ) echo "Please answer with Y or N.";;
esac
timedatectl set-ntp true

## Partitioning the drive
read -p "PLEASE READ THE FDISK OUTPUT CAREFULLY, THIS CAN FUCK UP YOUR SYSTEM IF YOU ALREADY HAVE AN INSTALLED OS!!!! [Press ENTER]"
fdisk -l
echo "Which drive are you partitioning? [/dev/sdX]"
read drive
read -p "Entering fdisk... Please make partition 1 root and partition 2 swap [Press ENTER]"
fdisk $drive

## Formatting the partitions
mkfs.ext4 $drive\1
mkswap $drive\2

## Mounting partitions
mount $drive\1 /mnt
swapon $drive\2

## Installing packages through pacstrap
read -p "Now installing the system... [Press ENTER]"
pacstrap /mnt base linux linux-firmware mkinitcpio syslinux xfce4 xorg xorg-apps xterm xorg-xinit firefox networkmanager
