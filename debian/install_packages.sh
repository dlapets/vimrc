#!/bin/bash
#apt-get update
#apt-get upgrade

DEBIAN_FRONTEND=noninteractive
INSTALL="apt-get -yq install"

echo "Install cli tools?"
read CHK
if [[ "$CHK" == "y" ]]; then 
    $INSTALL \
        build-essential \
        curl \
        fortune-mod \
        git \
        jq \
        make \
        psmisc \
        silversearcher-ag \
        sudo \
        tmux \
        vim-nox \
        zsh \
        ;
fi

echo "Install X11 and friends?"
read CHK
if [[ "$CHK" == "y" ]]; then 
    $INSTALL \
        arandr \
        feh \
        firefox-esr \
        libnotify-bin \
        notification-daemon \
        openbox \
        rxvt-unicode \
        ttf-mscorefonts-installer \
        x11-common \
        x11-session-utils \
        x11-utils \
        xclip \
        xfonts-terminus \
        xserver-xorg \
        ;

    echo "Install eyecandy?"
    read CHK
    if [[ "$CHK" == "y" ]]; then 
        $INSTALL \
            compton \
            tint2 \
            ;
    fi

    echo "Install big big fonts?"
    read CHK
    if [[ "$CHK" == "y" ]]; then 
        $INSTALL \
            fonts-noto \
            fonts-roboto \
            ;
    fi
fi



echo "Install linux kernel headers?"
read CHK
if [[ "$CHK" == "y" ]]; then 
    $INSTALL \
        linux-headers-amd64 \
        ;
fi

echo "Install misc. firmware/drivers?"
read CHK
if [[ "$CHK" == "y" ]]; then 
    $INSTALL \
        amd64-microcode \
        firmware-amd-graphics \
        firmware-linux-nonfree \
        firmware-realtek \
        ;
fi