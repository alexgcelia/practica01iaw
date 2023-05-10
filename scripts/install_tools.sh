#!/bin/bash

#Habilita que se muestre lps comandos ejecutados en el script
set -x

#--------------------------------------
#### VARIABLES DE CONFIGURACIÓN ####
PHPMYADMIN_USER=alexg
PHPMYADMIN_PASS=alexg
#--------------------------------------

# Actualizamos los repositorios
apt update

#Actualizamos los programas a la última versión disponible
apt upgrade -y

#--------------------------------------
#Instalación phpMyAdmin
#--------------------------------------

#Paso 1. Instalación de las dependencias
apt install php-mbstring php-zip php-gd php-json php-curl -y

#Paso 2. Descarga el código fuente desde la página oficial (https://www.phpmyadmin.net/)
wget https://files.phpmyadmin.net/phpMyAdmin/5.2.1/phpMyAdmin-5.2.1-all-languages.zip -O /tmp/phpmyadmin.zip

#Paso 3. Instalamos la utilidad unzip
apt install unzip -y

#Paso 4. Descomprimimos el código fuente de phpMyAdmin
unzip -o /tmp/phpmyadmin.zip -d /var/www/html

#Paso 5. Eliminamos instalaciones previas de phpMyAdmin
rm -rf /var/www/html/phpmyadmin

#Paso 6. Renombramos el directorio de phpMyAdmin
mv /var/www/html/phpMyAdmin-5.2.1-all-languages /var/www/html/phpmyadmin

#Paso 7. Creamos el archivo de configuración a partir del archivo de ejemplo
mv /var/www/html/phpmyadmin/config.sample.inc.php /var/www/html/phpmyadmin/config.inc.php

#Paso 8. Creamos la base de datos de phpMyAdmin
mysql -u root < /var/www/html/phpmyadmin/sql/create_tables.sql

#Paso 9. Creamos un usuario en MySQL para phpMyAdmin
mysql -u root <<< "DROP USER IF EXISTS $PHPMYADMIN_USER@localhost;"
mysql -u root <<< "CREATE USER $PHPMYADMIN_USER@localhost IDENTIFIED BY '$PHPMYADMIN_PASS';"
mysql -u root <<< "GRANT ALL PRIVILEGES ON phpmyadmin.* TO $PHPMYADMIN_USER@localhost;"

#Modificamos el propietario y el grupo
chown -R www-data:www-data /var/www/html