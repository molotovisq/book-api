#!/bin/bash
# A máquina deve possuir o sudo instalado
# Script feito por: @molotovisq

# Atualizar o sistema
sudo apt update
sudo apt upgrade -y


# Instalar o Git
sudo apt install -y git


# Instalar o PHP mais recente
sudo apt install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2 curl
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/sury-php.list
curl -fsSL  https://packages.sury.org/php/apt.gpg| sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/sury-keyring.gpg
sudo apt update
sudo apt install -y php8.2


# Dependencias mais usadas do PHP
sudo apt install openssl php-bcmath php-curl php-xml php-json php-mbstring php-mysql php-tokenizer php-zip


# Instalar o MySQL
sudo apt update 
sudo apt -y  install wget
wget https://repo.mysql.com//mysql-apt-config_0.8.22-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.22-1_all.deb
sudo apt update
sudo apt install mysql-server

# Instalar o Composer (gerenciador de dependências do PHP)
curl -sS https://getcomposer.org/installer -o composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
echo $HASH
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
alias composer='/usr/local/bin/composer'
composer


# Configurar o Laravel
#cp .env.example .env
#php artisan key:generate

echo "A instalação foi concluída!"

#composer create-project laravel/laravel book-api
#php artisan make:migration create_products_table --create=books