# Debian i3

This repo will include all the steps I'll use to setup Debian Linux with i3 for
ground up.

## Debian Image

Basic image  
Install no Desktop  
Will need external usb with drivers for network card  
TODO: Relocate the link

### Install

Document install process

 - Boot from usb
 - Select 'Advanced Options...'
 - Select 'Expert Install'
 - 'Choose a language'
   - Follow the prompts: Language, Location,
     Local(how things are displayed),
     Additional local(s), Select default local
 - Skip 'Access software for a blind person ...'
 - 'Configure Keyboard'
   - Select the layout you want
 - 'Detect and mount installation media'
 - 'Load installer components ...'
   - Load: event-modules
 - 'Detect network hardware'
   - If you get a message about missing drivers, you'll need them on an external
     usb (insert this before booting into the installer)
 - 'Configure the network'
   - Select your wifi
   - Select the correct type. Likely 'WPA/WPA2 PSK'
   - Enter the password for the network
   - 'Auto-configure networking': yes
   - Set a timeout. 30 should do
   - Enter a hostname. This is the computer name
   - Leave domain black unless you want to be fancy
 - 'Setup users and passwords'
   - 'Enable shadow passwords': yes
   - 'Allow login as root': no
   - 'Enter your name'. That is your real name
   - 'Username for your account'. Your login
   - 'Choose a password for the user'. Your password
   - 'Reenter your password'
 - 'Configure the clock'
   - 'Set the clock using NTP': yes
   - 'NTP server to use'. Use the default
   - 'Select your time zone'
 - 'Detect disks'
 - 'Partition disks'
   - Select 'Guided - use entire disk'
   - Select the disk to partition and eventually install onto
   - Select 'All files in one partition'
   - Select 'Finish partitioning and write changes to disk'
   - Verify the changes and select 'Yes'
 - 'Install the base system'
   - Select 'linux-image-amd64'
   - Select 'generic: include all available drivers'
 - 'Configure the package manager'
   - 'Use network mirror': yes
   - Select 'http'
   - Select your country, or the closest
   - Select 'deb.debian.org'
   - Leave proxy blanc if you you don't have any
   - 'Use non-free software': yes
   - 'Enable source repositories in APT': yes
   - 'Services to use': Select all
 - 'Select and install software'
   - 'Updates management on this system': Select 'Install security updates automatically'
   - 'Participate in the package usage survey': Select what you want
   - 'Choose software to install': Deselect 'Debian desktop environment' and 'GNOME'
 - 'Install the GRUB boot loader'
   - 'Force GRUB installation to the EFI removable media path': yes
 - 'Finish the installation'
   - 'Is the system clock set to UTC': yes
   - 'Installation id complete ...'. Select 'Continue' after removing the install media

## Setup

Either connect to internet and clone this repo or mount a usb with the source.

Now you can run `./setup-network.sh`  
This will install and setup NetworkManager so we have a stable network connection.  
You should rebot after this.

Now we setup all the core stuff. Run `./setup-core.sh`

A reboot is required at this point.  
After you can optionally use the `./install-brave.sh` script to install brave-browser.
