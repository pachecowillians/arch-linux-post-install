#!/bin/bash

clear

echo -e "\nATUALIZANDO O SISTEMA\n"

sudo pacman -Syyu

clear

echo -e "\nINSTALANDO O GIT\n"

sudo pacman -S git --noconfirm

clear

echo -e "\nBAIXANDO O PACOTE DE ÍCONES KORA\n"

sudo rm -r kora

git clone https://github.com/bikass/kora.git

cd kora

ls
