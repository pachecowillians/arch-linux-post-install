# !/bin/bash

clear

echo -e "\nAtualizando o sistema\n"

sudo pacman -Syyu

clear

echo -e "\nInstalando Git\n"

sudo pacman -S git zip unzip tar --noconfirm

clear

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

echo -e "\nInstalando fonte Inter\n"

sudo pacman -S inter-font --noconfirm

clear

echo -e "\nInstalando painel Plank\n"

sudo pacman -S plank --noconfirm

clear

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