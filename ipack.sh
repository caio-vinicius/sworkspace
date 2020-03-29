#!/bin/bash

ipack()
{
    package=$1
    echo " - Instalando suporte para $package..."
    dpkg --list | grep $package > .check
    file="./.check"
    if [ -s "$file" ]
    then
        echo " - Você já tem suporte para $package."
        apt-cache policy snapd | grep -nF " *** " > .check
        if [ `head -c 1 .check` -ne 5 ]
        then
            read -p " * Versão ultrapassa para $package, deseja atualizar? (y/n): " res
            if [ $res = "y" ] || [ $res = "Y" ]
            then
                sudo apt-get install $package >> log.sfr
                echo "Atualização feita com sucesso!"
                sudo apt-get clean >> log.sfr
            fi
        fi
        rm -f .check
    else
        sudo apt-get -y install $package >> log.sfr
    fi
}

ipack $1
