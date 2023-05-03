#!/bin/bash

#Habilita que se muestre lps comandos ejecutados en el script
set -x

# Actualizamos los repositorios
apt update

#Actualizamos los programas a la última versión disponible
apt upgrade -y

#Instalación phpMyAdmin
#--------------------------

#Paso 1. Instalación de las dependencias
apt install php-mbstring php-zip php-gd php-json php-curl -y

#Paso 2. Descarga el código fuente desde la página oficial (https://www.phpmyadmin.net/)
wget https://files.phpmyadmin.net/phpMyAdmin/5.2.1/phpMyAdmin-5.2.1-all-languages.zip -O /tmp/phpmyadmin.zip

#Paso 3. Instalamos la utilidad unzip
apt install unzip -y

#Paso 4. Descomprimimos el código fuente de phpMyAdmin
unzip /tmp/phpmyadmin.zip -d /var/www/html
