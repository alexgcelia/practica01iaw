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