# !/bin/bash

clear

echo -e "\nAtualizando o sistema\n"

sudo pacman -Syyu

clear

echo -e "\nInstalando Git\n"

sudo pacman -S git zip unzip tar --noconfirm

clear

# ------------------------------------------------------------------------------------------

echo -e "\nPacote de ícones Papirus\n"

echo -e "\nClonando repositório\n"

git clone https://github.com/PapirusDevelopmentTeam/papirus-icon-theme.git

cd papirus-icon-theme

echo -e "\nSalvando arquivos no diretório /icons/\n"

sudo rm -r $HOME/.local/share/icons/

mkdir $HOME/.local/share/icons/

mv *Papirus* $HOME/.local/share/icons/

ls $HOME/.local/share/icons/

cd ../

sudo rm -r papirus-icon-theme

clear

# ------------------------------------------------------------------------------------------

echo -e "\nTema Orchis\n"

sudo rm -r Orchis-theme

git clone https://github.com/vinceliuice/Orchis-theme.git

clear

echo -e "\nSalvando arquivos no diretório /themes/\n"

ls

cd Orchis-theme/release/

sudo rm -r $HOME/.local/share/themes/

mkdir $HOME/.local/share/themes/

tar -xf Orchis.tar.xz -C $HOME/.local/share/themes/

ls $HOME/.local/share/themes/

cd ../../

sudo rm -r Orchis-theme

clear

# ------------------------------------------------------------------------------------------

echo -e "\nInstalando fonte Inter\n"

sudo pacman -S inter-font --noconfirm

clear

# ------------------------------------------------------------------------------------------

echo -e "\nInstalando yay\n"

echo -e "\nInstalando go\n"

sudo pacman -S go base-devel --noconfirm

sudo rm -r yay

echo -e "\nClonando repositório\n"

git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si --noconfirm

cd ../

sudo rm -r yay

sudo pacman -Rns go --noconfirm

# # ------------------------------------------------------------------------------------------

# clear

# echo -e "\nInstalando pacotes utilizados\n"

# sudo pacman -S discord docker docker-compose firefox gamemode gcc gcc-fortran gimp git gnu-free-fonts gpick gsfonts gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gzip inkscape jre-openjdk libreoffice-still make nano neofetch noto-fonts npm obs-studio opendesktop-fonts pavucontrol pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-equalizer python-pip reflector spotify-launcher telegram-desktop ttf-anonymous-pro ttf-arphic-ukai ttf-arphic-uming ttf-baekmuk ttf-bitstream-vera ttf-caladea ttf-carlito ttf-cascadia-code ttf-cormorant ttf-croscore ttf-dejavu ttf-droid ttf-eurof ttf-fantasque-sans-mono ttf-fira-code ttf-fira-mono ttf-fira-sans ttf-font-awesome ttf-hack ttf-hanazono ttf-hannom ttf-ibm-plex ttf-inconsolata ttf-indic-otf ttf-input ttf-ionicons ttf-iosevka-nerd ttf-jetbrains-mono ttf-joypixels ttf-junicode ttf-khmer ttf-lato ttf-liberation ttf-linux-libertine ttf-linux-libertine-g ttf-monofur ttf-monoid ttf-nerd-fonts-symbols ttf-opensans ttf-proggy-clean ttf-roboto ttf-roboto-mono ttf-sarasa-gothic ttf-sazanami ttf-tibetan-machine ttf-ubuntu-font-family unrar unzip virt-manager vi vim virtualbox vlc wget yarn zip zsh --noconfirm

# google-chrome insomnia-bin beekeeper-studio-bin masterpdfeditor-free notion-app onlyoffice-bin ttf-ms-fonts visual-studio-code-bin steam octave