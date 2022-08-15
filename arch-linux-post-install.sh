# !/bin/bash

# INSTALAÇÃO DO REFLECTOR

clear

echo -e "\nInstalando e configurando o reflector\n"

echo -e "\nSincronizando pacotes\n"

sudo pacman -Sy

echo -e "\nInstalando reflector\n"

sudo pacman -S reflector rsync curl --noconfirm

FILE=/etc/pacman.d/mirrorlist.bak

if ! [[ -f "$FILE" ]]; then
    echo -e "\nCriando backup do mirrorlist para $FILE\n"
    sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
fi

clear

echo -e "\nGerando mirrorlist\n"

sudo reflector --download-timeout 5 --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

# ATUALIZAÇÃO DO SISTEMA

clear

echo -e "\nAtualizando o sistema\n"

sudo pacman -Syyu --noconfirm

# INSTALAÇÃO DO GIT

clear

echo -e "\nInstalando Git\n"

sudo pacman -S git --noconfirm

# INSTALAÇÃO DO PACOTE DE ÍCONES PAPIRUS

clear

echo -e "\nPacote de ícones Papirus\n"

echo -e "\nClonando repositório\n"

git clone https://github.com/PapirusDevelopmentTeam/papirus-icon-theme.git

cd papirus-icon-theme

echo -e "\nSalvando arquivos no diretório /icons/\n"

FILE=$HOME/.local/share/icons/

if [[ -d "$FILE" ]]; then
    echo -e "\nRemovendo $FILE existente\n"
    sudo rm -r $FILE
fi

mkdir $HOME/.local/share/icons/

mv *Papirus* $HOME/.local/share/icons/

ls $HOME/.local/share/icons/

cd ../

FILE=papirus-icon-theme

if [[ -d "$FILE" ]]; then
    echo -e "\nRemovendo $FILE existente\n"
    sudo rm -r $FILE
fi

echo -e "\nAlterando ícones do sistema\n"

xfconf-query -c xsettings -p /Net/IconThemeName -s "Papirus"

# INSTALAÇÃO DO TEMA ORCHIS

clear

echo -e "\nTema Orchis\n"

FILE=Orchis-theme

if [[ -d "$FILE" ]]; then
    echo -e "\nRemovendo $FILE existente\n"
    sudo rm -r $FILE
fi

git clone https://github.com/vinceliuice/Orchis-theme.git

# INSTALAÇÃO DO TAR

clear

echo -e "\nInstalando Tar\n"

sudo pacman -S tar --noconfirm

echo -e "\nSalvando arquivos no diretório /themes/\n"

ls

cd Orchis-theme/release/

FILE=$HOME/.local/share/themes/

if [[ -d "$FILE" ]]; then
    echo -e "\nRemovendo $FILE existente\n"
    sudo rm -r $FILE
fi

mkdir $HOME/.local/share/themes/

tar -xf Orchis.tar.xz -C $HOME/.local/share/themes/

ls $HOME/.local/share/themes/

cd ../../

FILE=Orchis-theme

if [[ -d "$FILE" ]]; then
    echo -e "\nRemovendo $FILE existente\n"
    sudo rm -r $FILE
fi

echo -e "\nAlterando tema do sistema\n"

xfconf-query -c xsettings -p /Net/ThemeName -s "Orchis-Dark"

# INSTALAÇÃO DO YAY

clear

echo -e "\nInstalação do yay\n"

echo -e "\nInstalando Go\n"

sudo pacman -S go base-devel --noconfirm

FILE=yay

if [[ -d "$FILE" ]]; then
    echo -e "\nRemovendo $FILE existente\n"
    sudo rm -r $FILE
fi

echo -e "\nClonando repositório\n"

git clone https://aur.archlinux.org/yay.git

cd yay

echo -e "\nInstalando yay\n"

makepkg -si --noconfirm

cd ../

FILE=yay

if [[ -d "$FILE" ]]; then
    echo -e "\nRemovendo $FILE existente\n"
    sudo rm -r $FILE
fi

echo -e "\nRemovendo Go\n"

sudo pacman -Rns go --noconfirm

# INSTALAÇÃO DE PACOTES UTILIZADOS VIA PACMAN

clear

echo -e "\nInstalando pacotes utilizados\n"

sudo pacman -S blender discord docker docker-compose firefox gamemode gcc gcc-fortran gimp git gnu-free-fonts gpick gsfonts gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gzip gparted inkscape jq jre-openjdk libreoffice-still linux-headers make nano neofetch noto-fonts npm obs-studio opendesktop-fonts pavucontrol pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-equalizer python-pip spotify-launcher telegram-desktop ttf-anonymous-pro ttf-arphic-ukai ttf-arphic-uming ttf-baekmuk ttf-bitstream-vera ttf-caladea ttf-carlito ttf-cascadia-code ttf-cormorant ttf-croscore ttf-dejavu ttf-droid ttf-eurof ttf-fantasque-sans-mono ttf-fira-code ttf-fira-mono ttf-fira-sans ttf-font-awesome ttf-hack ttf-hanazono ttf-hannom ttf-ibm-plex ttf-inconsolata ttf-indic-otf ttf-input ttf-ionicons ttf-iosevka-nerd ttf-jetbrains-mono ttf-joypixels ttf-junicode ttf-khmer ttf-lato ttf-liberation ttf-linux-libertine ttf-linux-libertine-g ttf-monofur ttf-monoid ttf-nerd-fonts-symbols ttf-opensans ttf-proggy-clean ttf-roboto ttf-roboto-mono ttf-sarasa-gothic ttf-sazanami ttf-tibetan-machine ttf-ubuntu-font-family inter-font unrar unzip virt-manager vi vim virtualbox vlc wget xfce4-screenshooter xfce4-screensaver xfce4-taskmanager yarn zip zsh --noconfirm

# INSTALAÇÃO DE PACOTES UTILIZADOS DO AUR

clear

echo -e "\nInstalando pacotes utilizados com o yay\n"

echo y | LANG=C yay --noprovides --answerdiff None --answerclean None --mflags "--noconfirm" $PKGNAME

yay -S google-chrome insomnia-bin beekeeper-studio-bin masterpdfeditor-free notion-app onlyoffice-bin ttf-ms-fonts visual-studio-code-bin

# INSTALAÇÃO DA STEAM

clear

echo -e "\nInstalando Steam\n"

echo -e "\nEditando /etc/pacman.conf\n"

sed -z 's/#\[multilib\]\n#Include = \/etc\/pacman.d\/mirrorlist/\[multilib\]\nInclude = \/etc\/pacman.d\/mirrorlist/' /etc/pacman.conf >tmp.$$.txt && sudo mv tmp.$$.txt /etc/pacman.conf

echo -e "\nAtualizando lista de pacotes\n"

sudo pacman -Sy

echo -e "\nInstalando Steam\n"

sudo pacman -S steam

# INSTALAÇÃO DO ZSH

clear

echo -e "\nInstalando Zsh\n"

sudo pacman -S zsh zsh-completions --noconfirm

# INSTALAÇÃO DO OH MY ZSH

echo -e "\nInstalando Oh My Zsh\n"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# INSTALAÇÃO DO TEMA SPACESHIP

echo -e "\nInstalando tema Spaceship\n"

echo -e "\nCriando link simbólico para pasta do Spaceship\n"

sudo git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"

sudo ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" ~/.oh-my-zsh/themes/spaceship.zsh-theme

# CONFIGURAÇÃO DO SPACESHIP

echo -e "\nAplicando tema Spaceship\n"

sudo sed -i 's/ZSH_THEME=.*/ZSH_THEME="spaceship"/g' ~/.zshrc

echo -e "\nConfigurando o Spaceship\n"

echo 'SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "' >>~/.zshrc

echo -e "\nPlugins do Zsh\n"

# INSTALAÇÃO DO ZINIT

echo -e "\nInstalando ZInit\n"

bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# CONDIGURAÇÃO DO ZINIT

echo -e "\nConfigurando ZInit\n"

echo 'zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
' >>~/.zshrc

clear

# INSTALAÇÃO DAS EXTENSÕES DO VSCODE

clear

echo -e "\nInstalando extensões do vscode\n"

cat vscode-extensions.list | xargs -L 1 code --install-extension

# CREATING VSCODE SETTINGS.JSON IF NOT EXISTS

echo -e "\nCriando o settings.json do vscode caso não exista\n"

FILE=$HOME/.config/Code/User/settings.json

if ! [[ -f "$FILE" ]]; then
    echo -e "\nCriando settings.json em $FILE\n"
    echo '{
  "git.enableSmartCommit": true,
  "git.confirmSync": false
}' >>$FILE
fi

# DEFINIÇÃO DA FONTE DO TERMINAL INTEGRADO DO VSCODE

echo -e "\nDefinindo a fonte do terminal integrado do VS Code\n"

jq '. + { "terminal.integrated.fontFamily": "Fira Code Retina" }' $HOME/.config/Code/User/settings.json >tmp.$$.json && mv tmp.$$.json $HOME/.config/Code/User/settings.json

# DEFINIÇÃO DO ZSH COMO SHELL DO VSCODE

echo -e "\nDefinição do zsh como shell padrão do terminal integrado do VS Code\n"

jq '. + { "#terminal.integrated.shell.linux": "/bin/zsh" }' $HOME/.config/Code/User/settings.json >tmp.$$.json && mv tmp.$$.json $HOME/.config/Code/User/settings.json

# DEFINIÇÃO DAS LINGUAGENS DO CSPELL

echo -e "\nDefinição das linguagens do cspell como português (br) e inglês\n"

jq '. + { "cSpell.language": "en,pt-BR" }' $HOME/.config/Code/User/settings.json >tmp.$$.json && mv tmp.$$.json $HOME/.config/Code/User/settings.json

# HABILITAÇÃO DA TELA DE BLOQUEIO

clear

echo -e "\nHabilitando tela de bloqueio\n"

xfconf-query -c xfce4-session -p /general/LockCommand -s "xlock" --create -t string

xfconf-query -c xfce4-session -p /general/LockCommand -s "xlock"

xfce4-screensaver &

# INSTALAÇÃO DO PACCACHE

echo -e "\nInstalando paccache\n"

sudo pacman -S pacman-contrib --noconfirm

# LIMPEZA DO CACHE

echo -e "\nLimpando cache\n"

sudo pacman -Sc --noconfirm

paccache -r

# CONFIGURAÇÃO DA IDENTIDADE PADRÃO

echo -e "\nConfigurando identidade padrão do git\n"

git config --global user.email "willianpacheco31@gmail.com"
git config --global user.name "Willian Pacheco Silva"