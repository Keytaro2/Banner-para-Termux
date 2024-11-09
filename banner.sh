#!/bin/bash
#Variables de los colores
azul="\033[1;34m"
blanco="\033[1;37m"
#Mueatra el banner
echo -e $azul "                                                                          "
echo " ▄▄▄▄    ▄▄▄       ███▄    █  ███▄    █ ▓█████  ██▀███      ██▓ ███▄ ▄███▓  ▄████  "
echo "▓█████▄ ▒████▄     ██ ▀█   █  ██ ▀█   █ ▓█   ▀ ▓██ ▒ ██▒   ▓██▒▓██▒▀█▀ ██▒ ██▒ ▀█▒ "
echo "▒██▒ ▄██▒██  ▀█▄  ▓██  ▀█ ██▒▓██  ▀█ ██▒▒███   ▓██ ░▄█ ▒   ▒██▒▓██    ▓██░▒██░▄▄▄░ "
echo "▒██░█▀  ░██▄▄▄▄██ ▓██▒  ▐▌██▒▓██▒  ▐▌██▒▒▓█  ▄ ▒██▀▀█▄     ░██░▒██    ▒██ ░▓█  ██▓ "
echo "░▓█  ▀█▓ ▓█   ▓██▒▒██░   ▓██░▒██░   ▓██░░▒████▒░██▓ ▒██▒   ░██░▒██▒   ░██▒░▒▓███▀▒ "
echo "░▒▓███▀▒ ▒▒   ▓▒█░░ ▒░   ▒ ▒ ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒▓ ░▒▓░   ░▓  ░ ▒░   ░  ░ ░▒   ▒  "
echo "▒░▒   ░   ▒   ▒▒ ░░ ░░   ░ ▒░░ ░░   ░ ▒░ ░ ░  ░  ░▒ ░ ▒░    ▒ ░░  ░      ░  ░   ░  "
echo " ░    ░   ░   ▒      ░   ░ ░    ░   ░ ░    ░     ░░   ░     ▒ ░░      ░   ░ ░   ░  "
echo " ░            ░  ░         ░          ░    ░  ░   ░         ░         ░         ░  "
echo "      ░                                                                            "
echo "                                                                                   "
echo -e $blanco "                                                "
# Pide al usuario que ingrese el nombre de la imagen
read -p "Ingresa la direccion de la carpeta donde tengas la imagen: " direccion
read -p "Ingrese el nombre de la imagen (con extensión, ej: dragon.png ): " imagen
# Instala los paquetes necesarios
pkg update ; pkg upgrade -y
yes | { pkg install termimage && pkg install fish ; }
# Se mete a la carpeta de la imagen
  cd $direccion
# Verifica si la imagen existe
if [ -f "$imagen" ] ; then
# Muestra la imagen seleccionada
  termimage $imagen
  termimage $imagen >> motd
  mv motd /$HOME
  cd /data/data/com.termux/files/usr/etc/
  rm motd
  mv /$HOME/motd .
#  chsh -s fish
  # Muestra un mensaje de éxito
  echo -e "\nInstalado correctamente :)"
else
  # Muestra un mensaje de error
  echo -e "\nError: No se pudo instalar la imagen"
fi


