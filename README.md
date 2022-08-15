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
- Apply Dracula Theme in vscode
- Apply Material Icon Icon Theme in vscode
- Set keyboard shortcuts
- Set Inter font in Appearance app
- Configure the panel

