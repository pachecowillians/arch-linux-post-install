# Arch Linux Post-Install

This project is a shell script created to setup the Arch Linux, install themes, icon pack and apps after installing the Operating System.

## Arch Install

Initially, i installed Arch Linux using the archinstall installation script provided in the official Arch installation image. This image can be found on the distribution's official website https://archlinux.org/download/.

### Bootable USB stick

After download the ISO, just create a bootable USB stick to install it on the machine. This is not necessary when you want to install Arch Linux on a virtual machine. In this case, you just need to import the image as a virtual disk.

To create the bootable pendrive, use ```fdisk``` as shown below, in order to list all devices and identify the pendrive that will receive the image.

```sh
sudo fdisk -l
```

Generally, the USB stick's mount point is located in a directory like */dev/sdx*, where *x* represents some letter of the alphabet.

With the directory defined, the device is unmounted with the command ```umount```

```sh
sudo umount /dev/sdx
```

Finally, just use the ```dd``` command to create the bootable flash drive defining the path to the downloaded iso and the flash drive mount point, as shown below.

```sh
sudo dd bs=4M if=/path/to/ISOfile of=/dev/sdx status=progress oflag=sync
```

### Arch Linux Installation

To install Arch, boot from the USB stick created in the previous section and wait until a terminal appears.

If the installation is done in a virtual machine, there is no need to connect to the internet, as the virtual machine receives the configured internet from the host machine. On the other hand, if the installation is on the HD, it is necessary to configure the network card before starting the installation. 

#### WiFI setup

In case of using the wireless interface, first use the following command to get the name of the wireless interface:

```sh
iw dev
```

Usually the name of the wireless interface is *wlan0*.

Once the wireless network interface is defined, in all the following commands, replace *interface* with wlan0 or the name of the WiFi interface used.

After identifying the name of the interface, check the status of the links with the command below:

```sh
iw dev interface link
```

Then, the following commands are used to activate the network interface and verify that its status is active.

```sh
ip link set interface up
ip link show interface
```

After activating the network interface, iwctl is started to connect to some network.

```sh
iwctl
```

To know the name of the wireless device, use the following command:

```sh
device list
```

After identifying the device name, in the commands below, replace the name *device* with the device name obtained above.

To scan the available networks, use the command below:

```sh
station device scan
```

To list the available networks, use the command below:

```sh
station device get-networks
```

In the list generated above, you must identify the *SSID* of the network you want to connect to and connect to it using the command below:

```sh
station device connect SSID
```

In the above command, replace SSID for the SSID obtained in the previous listing.

After connecting to the network, simply run the command ```exit``` to exit the *iwctl* environment and check the network using the command below:

```sh
ping 8.8.8.8
```

#### Installation

With the internet working, to start the installation, just run the following command to start the Arch Linux installer:

```sh
archinstall
```

The installer will have a series of menus to configure the system language, keyboard language, time zone, disk partitioning, and many other options. In this case, the XFCE graphical environment will be used. So, in the profile section, select the *desktop* option and choose to install xfce so that the script works fully. Also, when selecting the language, remember to select the option that **does not contain UTF-8 encoding**, as it causes problems with accentuation in some programs such as Telegram Desktop.

After configuring the installation, just select the *Install* option and start the Arch installation.

## Post Install

To run the script, clone the repository with ```git clone``` :

```sh
git clone https://github.com/pachecowillians/arch-linux-post-install.git
```

After cloning the repository, enter in the project folder using ```cd``` :

```sh
cd arch-linux-post-install
```

To run the script, it need to receive executable permission using ```chmod``` :

```sh
chmod +x arch-linux-post-install.sh
```

Then, just run the script:

```sh
./arch-linux-post-install.sh
```

This script configures many applications, but requires some manual configuration. Manual configuration is:

- Apply Orchis Theme in window settings
- Apply Inter Font in windows title
- Set Inter font in Appearance app
- Apply Dracula Theme in vscode
- Apply Material Icon Icon Theme in vscode
- Set keyboard shortcuts
- Configure the panel

After performing the installation, in most cases, it is necessary to copy the personal files from an external HD to the HD where Arch was installed. When this copy is done as a superuser, it is necessary to set the local user as the owner of the files and ensure that he has permissions on the files. To do this, run the command below:

```sh
sudo chown -R $USER:$USER /PATH/TO/COPIED/FOLDER
```

The above command can also be used to allow the file system to have edit access to data from an external HD if an SSD is used for the operating system and a HD for the files.

If you use VirtualBox to run virtual machines, when creating new machines from existing images, it is necessary to reconfigure the images to make them compatible with the current configuration of the operating system. To do this, run the command below:

```sh
sudo /sbin/rcvboxdrv setup
```
