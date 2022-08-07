#!/bin/bash

clear

echo -e "\nAtualizando o sistema\n"

sudo pacman -Syyu

clear

echo -e "\nInstalando Git\n"

sudo pacman -S git --noconfirm

clear

echo -e "\nPacote de ícones Kora\n"

echo -e "\nClonando repositório\n"

git clone https://github.com/bikass/kora.git

cd kora

clear

echo -e "\nSalvando arquivos no diretório /icons/\n"

sudo rm -r $HOME/.local/share/icons/

mkdir $HOME/.local/share/icons/

mv *kora* $HOME/.local/share/icons/

ls $HOME/.local/share/icons/

cd ../

sudo rm -r kora