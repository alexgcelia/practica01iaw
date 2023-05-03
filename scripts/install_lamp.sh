#!/bin/bash

#Habilita que se muestre lps comandos ejecutados en el script
set -x

# Actualizamos los repositorios
apt update

#Actualizamos los programas a la última versión disponible
apt upgrade -y

#Instalación Apache
apt install apache2 -y

#Instalación MySQL  
apt install mysql-server -y

#Instalación módulo PHP
apt install php libapache2-mod-php php-mysql -y

#Copiamos el archivo de prueba de PHP al directorio de apache
cp ../php/index.php /var/www/html

#Copiamos archivo dir.conf al directorio de configuración de apache
cp ../conf/dir.conf /etc/apache2/mods-available

#Reiniciamos el servidor web Apache
systemctl restart apache2

