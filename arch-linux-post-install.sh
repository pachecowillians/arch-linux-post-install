# !/bin/bash

# clear

# echo -e "\nInstalando e connfigurando o reflector\n"

# echo -e "\nSincronizando pacotes\n"

# sudo pacman -Sy

# echo -e "\nInstalando reflector\n"

# sudo pacman -S reflector rsync curl --noconfirm

# FILE=/etc/pacman.d/mirrorlist.bak

# if ! [[ -f "$FILE" ]]; then
#     echo -e "\nCriando backup do mirrorlist para $FILE\n"
#     sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
# fi

# sudo reflector --download-timeout 5 --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

# clear

# echo -e "\nAtualizando o sistema\n"

# sudo pacman -Syyu --noconfirm

# clear

# echo -e "\nInstalando Git\n"

# sudo pacman -S git --noconfirm

# clear

# echo -e "\nPacote de ícones Papirus\n"

# echo -e "\nClonando repositório\n"

# git clone https://github.com/PapirusDevelopmentTeam/papirus-icon-theme.git

# cd papirus-icon-theme

# echo -e "\nSalvando arquivos no diretório /icons/\n"

# sudo rm -r $HOME/.local/share/icons/

# mkdir $HOME/.local/share/icons/

# mv *Papirus* $HOME/.local/share/icons/

# ls $HOME/.local/share/icons/

# cd ../

# sudo rm -r papirus-icon-theme

# echo -e "\nAlterando ícones do sistema\n"

# xfconf-query -c xsettings -p /Net/IconThemeName -s "Papirus"

# clear

# echo -e "\nTema Orchis\n"

# sudo rm -r Orchis-theme

# git clone https://github.com/vinceliuice/Orchis-theme.git

# clear

# echo -e "\nInstalando Git\n"

# sudo pacman -S tar --noconfirm

# clear

# echo -e "\nSalvando arquivos no diretório /themes/\n"

# ls

# cd Orchis-theme/release/

# sudo rm -r $HOME/.local/share/themes/

# mkdir $HOME/.local/share/themes/

# tar -xf Orchis.tar.xz -C $HOME/.local/share/themes/

# ls $HOME/.local/share/themes/

# cd ../../

# sudo rm -r Orchis-theme

# echo -e "\nAlterando tema do sistema\n"

# xfconf-query -c xsettings -p /Net/ThemeName -s "Orchis-Dark"

# clear

# echo -e "\nInstalação do yay\n"

# echo -e "\nInstalando Go\n"

# sudo pacman -S go base-devel --noconfirm

# sudo rm -r yay

# echo -e "\nClonando repositório\n"

# git clone https://aur.archlinux.org/yay.git

# cd yay

# echo -e "\nInstalando yay\n"

# makepkg -si --noconfirm

# cd ../

# sudo rm -r yay

# echo -e "\nRemovendo Go\n"

# sudo pacman -Rns go --noconfirm

# clear

# echo -e "\nInstalando pacotes utilizados\n"

# sudo pacman -S discord docker docker-compose firefox gamemode gcc gcc-fortran gimp git gnu-free-fonts gpick gsfonts gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gzip inkscape jq jre-openjdk libreoffice-still make nano neofetch noto-fonts npm obs-studio opendesktop-fonts pavucontrol pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-equalizer python-pip spotify-launcher telegram-desktop ttf-anonymous-pro ttf-arphic-ukai ttf-arphic-uming ttf-baekmuk ttf-bitstream-vera ttf-caladea ttf-carlito ttf-cascadia-code ttf-cormorant ttf-croscore ttf-dejavu ttf-droid ttf-eurof ttf-fantasque-sans-mono ttf-fira-code ttf-fira-mono ttf-fira-sans ttf-font-awesome ttf-hack ttf-hanazono ttf-hannom ttf-ibm-plex ttf-inconsolata ttf-indic-otf ttf-input ttf-ionicons ttf-iosevka-nerd ttf-jetbrains-mono ttf-joypixels ttf-junicode ttf-khmer ttf-lato ttf-liberation ttf-linux-libertine ttf-linux-libertine-g ttf-monofur ttf-monoid ttf-nerd-fonts-symbols ttf-opensans ttf-proggy-clean ttf-roboto ttf-roboto-mono ttf-sarasa-gothic ttf-sazanami ttf-tibetan-machine ttf-ubuntu-font-family inter-font unrar unzip virt-manager vi vim virtualbox vlc wget xfce4-screenshooter yarn zip zsh --noconfirm

# clear

# echo -e "\nInstalando pacotes utilizados com o yay\n"

# echo y | LANG=C yay --noprovides --answerdiff None --answerclean None --mflags "--noconfirm" $PKGNAME

# yay -S google-chrome insomnia-bin beekeeper-studio-bin masterpdfeditor-free notion-app onlyoffice-bin ttf-ms-fonts visual-studio-code-bin microsoft-edge

# clear

echo -e "\nInstalando Steam\n"

echo -e "\nEditando /etc/pacman.conf\n"

sed -z 's/#\[multilib\]\n#Include = \/etc\/pacman.d\/mirrorlist/\[multilib\]\nInclude = \/etc\/pacman.d\/mirrorlist/' /etc/pacman.conf >tmp.$$.txt && sudo mv tmp.$$.txt /etc/pacman.conf 

# echo -e "\nAtualizando lista de pacotes\n"

# sudo pacman -Sy

# echo -e "\nInstalando Steam\n"

# sudo pacman -S steam --noconfirm

# echo -e "\nInstalando Zsh\n"

# sudo pacman -S zsh zsh-completions --noconfirm

# echo -e "\nInstalando Oh My Zsh\n"

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# echo -e "\nInstalando tema Spaceship\n"

# sudo rm -r $ZSH_CUSTOM/themes/spaceship-prompt

# sudo git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"

# echo -e "\nCriando link simbólico para pasta do Spaceship\n"

# sudo rm -r $ZSH_CUSTOM/themes/spaceship.zsh-theme

# sudo ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# echo -e "\nAplicando tema Spaceship\n"

# sudo sed -i 's/ZSH_THEME=.*/ZSH_THEME="spaceship"/g' ~/.zshrc

# echo -e "\nConfigurando o Spaceship\n"

# echo 'SPACESHIP_PROMPT_ORDER=(
#   user          # Username section
#   dir           # Current directory section
#   host          # Hostname section
#   git           # Git section (git_branch + git_status)
#   hg            # Mercurial section (hg_branch  + hg_status)
#   exec_time     # Execution time
#   line_sep      # Line break
#   vi_mode       # Vi-mode indicator
#   jobs          # Background jobs indicator
#   exit_code     # Exit code section
#   char          # Prompt character
# )
# SPACESHIP_USER_SHOW=always
# SPACESHIP_PROMPT_ADD_NEWLINE=false
# SPACESHIP_CHAR_SYMBOL="❯"
# SPACESHIP_CHAR_SUFFIX=" "' >> ~/.zshrc

# echo -e "\nPlugins do Zsh\n"

# echo -e "\nInstalando ZInit\n"

# bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# echo -e "\nConfigurando ZInit\n"

# echo 'zinit light zdharma/fast-syntax-highlighting
# zinit light zsh-users/zsh-autosuggestions
# zinit light zsh-users/zsh-completions
# ' >> ~/.zshrc

# FILE=$HOME/.config/Code/User/settings.json

# if ! [[ -f "$FILE" ]]; then
#     echo -e "\nCriando settings.json em $FILE\n"
#     echo '{
#   "git.enableSmartCommit": true,
#   "git.confirmSync": false
# }' >>$FILE
# fi

# echo -e "\nDefinindo a fonte do terminal integrado do VS Code\n"

# jq '. + { "terminal.integrated.fontFamily": "Fira Code Retina" }' $HOME/.config/Code/User/settings.json >tmp.$$.json && mv tmp.$$.json $HOME/.config/Code/User/settings.json

# echo -e "\nDefinindo o zsh como shell padrão do terminal integrado do VS Code\n"

# jq '. + { "#terminal.integrated.shell.linux": "/bin/zsh" }' $HOME/.config/Code/User/settings.json >tmp.$$.json && mv tmp.$$.json $HOME/.config/Code/User/settings.json
