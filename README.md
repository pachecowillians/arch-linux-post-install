# Arch Linux Post-Install

<p align="center">
  <img src="https://raw.githubusercontent.com/pachecowillians/svg-icons/24f3ae63c7a048dba837ce12386b4492d1f0b9fb/img/arch-linux.svg" alt="Arch Linux Logo" height="100px">
</p>

This project is a shell script created to set up Arch Linux, install themes, icon packs, and apps after installing the operating system.

## Arch Install

To begin with, I installed Arch Linux using the `archinstall` installation script provided in the official Arch installation image. You can find this image on the distribution's official website at https://archlinux.org/download/.

### Bootable USB Stick

After downloading the ISO, create a bootable USB stick to install Arch Linux on your machine. This step is not necessary if you are installing Arch Linux on a virtual machine. In that case, you can simply import the image as a virtual disk.

To create the bootable USB stick, use `fdisk` to list all devices and identify the USB stick that will receive the image:

```sh
sudo fdisk -l
```

Generally, the USB stick's mount point is located in a directory like `/dev/sdx`, where `x` represents a letter of the alphabet.

Once you have identified the directory, unmount the device using the `umount` command:

```sh
sudo umount /dev/sdx
```

Finally, use the `dd` command to create the bootable flash drive by specifying the path to the downloaded ISO file and the mount point of the flash drive:

```sh
sudo dd bs=4M if=/path/to/ISOfile of=/dev/sdx status=progress oflag=sync
```

### Arch Linux Installation

To install Arch, boot from the USB stick created in the previous section and wait until a terminal appears.

If you are installing in a virtual machine, there is no need to connect to the internet as the virtual machine receives internet configuration from the host machine. However, if you are installing on a physical machine, you need to configure the network card before starting the installation.

#### Wi-Fi Setup

If you are using a wireless interface, first use the following command to get the name of the wireless interface:

```sh
iw dev
```

Usually, the name of the wireless interface is `wlan0`.

After identifying the wireless network interface, replace `interface` with `wlan0` or the name of the wireless interface you are using in the following commands.

Check the status of the links using the command below:

```sh
iw dev interface link
```

Then, use the following commands to activate the network interface and verify that its status is active:

```sh
ip link set interface up
ip link show interface
```

Once the network interface is activated, start `iwctl` to connect to a network:

```sh
iwctl
```

To know the name of the wireless device, use the following command:

```sh
device list
```

Replace `device` with the device name obtained from the command above in the following commands.

To scan for available networks, use the command below:

```sh
station device scan
```

To list the available networks, use the command below:

```sh
station device get-networks
```

From the generated list, identify the SSID of the network you want to connect to and use the following command to connect to it:

```sh
station device connect SSID
```

Replace `SSID` with the SSID obtained from the previous listing.

After connecting to the network, exit the `iwctl` environment by running the following command:

```sh
exit
```

Then, check the network connection using the command below:

```sh
ping 8.8.8.8
```

#### Installation

With the internet connection established, start the Arch Linux installer by running the following command:

```sh
archinstall
```

The installer will guide you through configuring the system

 language, keyboard layout, time zone, disk partitioning, and other options. Select the `desktop` option in the profile section to install XFCE, which is required for the script to work properly. Also, when selecting the language, choose the option that **does not include UTF-8 encoding** as it may cause issues with accentuation in some programs like Telegram Desktop.

After configuring the installation, select the `Install` option to start the Arch installation.

## Post Install

To run the script, clone the repository using `git clone`:

```sh
git clone https://github.com/pachecowillians/arch-linux-post-install.git
```

Navigate to the project folder using `cd`:

```sh
cd arch-linux-post-install
```

Make the script executable by granting it the necessary permissions using `chmod`:

```sh
chmod +x arch-linux-post-install.sh
```

Then, run the script:

```sh
./arch-linux-post-install.sh
```

### Manual Setup

The script automates the configuration of many applications but requires some manual configuration. Here are the manual configurations you need to perform:

- Apply the Orchis Theme in the window settings.
- Apply the Inter Font in the windows title.
- Set the Inter font in the Appearance app.
- Apply the Dracula Theme in VSCode.
- Apply the Material Icon Icon Theme in VSCode.
- Set up keyboard shortcuts.
- Configure the panel.

### Handling HD Permissions

After installation, you may need to copy personal files from an external HD to the HD where Arch Linux is installed. When copying files as a superuser, it is necessary to set the local user as the owner of the files and ensure that they have proper permissions. To do this, run the following command:

```sh
sudo chown -R $USER:$USER /PATH/TO/COPIED/FOLDER
```

This command can also be used to grant edit access to data from an external HD if you have an SSD for the operating system and an HD for the files.

### Configuring VirtualBox

If you use VirtualBox to run virtual machines and you need to create new machines from existing images, you may need to reconfigure the images to make them compatible with the current operating system configuration. To do this, run the following command:

```sh
sudo /sbin/rcvboxdrv setup
```

### Installing an HTTP Server

If you want to install a simple HTTP server, run the following command:

```sh
sudo npm -g install http-server
```

Feel free to modify the script and add any additional configurations or applications that suit your needs.

### Binding a Broken Keyboard Key

If you have a broken key on your keyboard, you can assign the functionality of that key to another functional key. Here's an example of how to bind the letter "m" to the Menu key if the "m" key is broken.

1. Open a terminal and run the following command to bind the "m" key to the Menu key:
   
   ```sh
   echo "keycode 135 = m M m M mu mu mu" >> ~/.Xmodmap
   ```

   This command appends the keycode mapping to the `~/.Xmodmap` file.

2. After executing the command, the "m" key should be bound to the Menu key. Test it out by pressing the Menu key, and it should input the letter "m" instead.

This allows you to continue using the functionality of a broken key by mapping it to another key on your keyboard.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.